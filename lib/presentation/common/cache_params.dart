import 'dart:convert';
import 'package:kiano/data/request/customer_api_request.dart';

import '../../domain/usecase/hesab_tafsili_usecase.dart';
import '/data/response/customer_api_response.dart';
import '../../domain/usecase/plate_reader/plate_reader_get_instance_list_usecase.dart';
import '/data/mapper/mapper.dart';
import '/app/app_prefs.dart';
import '/domain/model/model.dart';
import '/domain/usecase/cache_params_usecase.dart';

class CacheParamsManager {
  final CacheParamsUseCase _useCase;
  final PlateReaderGetInstanceList _useCase2;
  final HesabTafsiliUseCase _hesabTafsiliUseCase;
  final AppPreferences _appPreferences;
  final List<Company> accessList = [];
  final List<PlateReaderInstanceList> plateReaderInstanceList = [];
  late CacheParams data =
      CacheParams([], [], [], [], [], [], [], [], [], [], []);
  final List<Tafsili> tafsili = [];
  Company? currentCompany;
  FiscalYearLoginData? currentFiscalYearLoginData;

  CacheParamsManager(this._useCase, this._appPreferences, this._useCase2, this._hesabTafsiliUseCase);

  updateData() async {
    if(currentFiscalYearLoginData != null) {
      tafsili.clear();
      final res = await _hesabTafsiliUseCase.execute(TafsiliRequest([], [], currentFiscalYearLoginData!.dbName));
      res.fold((l) => null, (r) => tafsili.addAll(r));
    }
    getLocalCachedParams();
    if (currentFiscalYearLoginData != null) {
      (await _useCase.execute(currentFiscalYearLoginData!.dbName)).fold((l) {},
          (r) {
        data = r;
      });
      if (currentCompany != null) {
        if (currentCompany!.plateReaderAccess) {
          // getLocalPlateReaderInstanceList();
          (await _useCase2.execute(null)).fold((l) => null,
              (r) {
                plateReaderInstanceList.clear();
                if(r != null) {
                  plateReaderInstanceList.addAll(r);
                }
              });
        }
      }
    }
  }

  getLocalCachedParams() {
    if (currentFiscalYearLoginData != null) {
      final response = _appPreferences.getCurrentFiscalYearDataCachedParams(
          currentFiscalYearLoginData!.dbName);
      if (response.isNotEmpty) {
        final json = jsonDecode(response);
        data = CacheParamsResponse.fromJson(json).toDomain();
      }
      // final response2 = _appPreferences.getCurrentFiscalYearDataHesabTafsili(
      //     currentFiscalYearLoginData!.dbName);
      // if (response.isNotEmpty) {
      //   final json = jsonDecode(response) as List<dynamic>;
      //   json.map((e) => TafsiliResponse.fromJson(e as Map<String, dynamic>).toDomain()).toList();
      // }
    }
  }

  getLocalPlateReaderInstanceList() {
    plateReaderInstanceList.clear();
    if (currentFiscalYearLoginData != null) {
      final response = _appPreferences.getCompanyPlateReaderInstanceList();
      if (response.isNotEmpty) {
        final List<dynamic> json = jsonDecode(response);
        plateReaderInstanceList.addAll(json.map((e) => e as PlateReaderInstanceList).toList());
      }
    }
  }

}
