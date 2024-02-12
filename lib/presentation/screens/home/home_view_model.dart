import 'dart:async';
import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'package:kiano/presentation/base/base_view_model.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '/presentation/common/cache_params.dart';
import '/domain/usecase/access_list_usecase.dart';
import '/domain/enums.dart';
import '../../resources/assets_manager.dart';
import '/domain/usecase/fiscal_year_db_auth.dart';
import '/data/mapper/mapper.dart';
import '/data/response/japo_api_response.dart';
import '/app/app_prefs.dart';
import '/app/di.dart';
import '/domain/model/model.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelOutputs, HomeViewModelInputs {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final FiscalYearDataBaseAuthUseCase _fiscalYearDataBaseAuthUseCase;
  final AccessListUseCase _accessListUseCase;
  final CacheParamsManager _cacheParamsManager;
  final List<Company> accessList = [];
  final StreamController<void> _accessListChangeStream =
      StreamController<void>.broadcast();
  final StreamController<KiaSystemModule> _navigatorStream =
      StreamController<KiaSystemModule>.broadcast();
  final StreamController<void> _companyChangeStream =
      StreamController<void>.broadcast();
  final StreamController<void> _fiscalYearChangeStream =
      StreamController<void>.broadcast();
  final StreamController<void> _logOutStream =
      StreamController<void>.broadcast();

  HomeViewModel(this._fiscalYearDataBaseAuthUseCase, this._accessListUseCase,
      this._cacheParamsManager);

  get currentFiscalYearLoginData =>
      _cacheParamsManager.currentFiscalYearLoginData;

  get currentCompany => _cacheParamsManager.currentCompany;

  @override
  void start() async {
    inputState.add(LoadingState());
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await getLocalAccessList();
      getRemoteAccessList();
      _cacheParamsManager.updateData();
      inputState.add(null);
    });
  }

  @override
  void dispose() {
    _accessListChangeStream.close();
    _companyChangeStream.close();
    _fiscalYearChangeStream.close();
    _logOutStream.close();
  }

  getRemoteAccessList() async {
    (await _accessListUseCase.execute(null)).fold((l) {
      inputState.add(ErrorState(message: l.message));
    }, (r) async {
      await _cacheParamsManager.updateData();
      await getLocalAccessList();
      inputState.add(null);
    });
  }

  getLocalAccessList() async {
    final response = _appPreferences.getCompanyAccessList();
    if (response.isNotEmpty) {
      final json = jsonDecode(response);
      await setAccessList(KianoAccessListResponse.fromJson(json).toDomain());
    }
  }

  setAccessList(List<Company> data) async {
    accessList.clear();
    accessList.addAll(data);
    await getCurrentCompany();
    accessListChangeInput.add(null);
  }

  getCurrentCompany() async {
    _cacheParamsManager.currentCompany = null;
    if (accessList.isNotEmpty) {
      final id = _appPreferences.getCurrentCompany();
      _cacheParamsManager.currentCompany = accessList[0];
      for (Company company in accessList) {
        if (company.id == id) {
          _cacheParamsManager.currentCompany = company;
          break;
        }
      }
    }
    await getCurrentFiscalYear();
    companyChangeInput.add(null);
  }

  getCurrentFiscalYear() async {
    _cacheParamsManager.currentFiscalYearLoginData = null;
    if (_cacheParamsManager.currentCompany != null) {
      final json = _appPreferences.getCurrentFiscalYearDataLogin();
      if (json.isNotEmpty) {
        final item = FiscalYearLoginData.fromJson(jsonDecode(json));
        updateDioBaseUrl(_cacheParamsManager.currentCompany!.serverAddress);
        (await _fiscalYearDataBaseAuthUseCase.execute(item)).fold(
            (l) => _cacheParamsManager.currentFiscalYearLoginData = null,
            (r) => _cacheParamsManager.currentFiscalYearLoginData = item);
      }
    }
    fiscalYearChangeInput.add(null);
  }

  selectCompany(int index) async {
    if (_cacheParamsManager.currentCompany != accessList[index]) {
      _cacheParamsManager.currentCompany = accessList[index];
      _appPreferences.setCurrentCompany(_cacheParamsManager.currentCompany!.id);
      inputState.add(LoadingState());
      await getCurrentFiscalYear();
      companyChangeInput.add(null);
      accessListChangeInput.add(null);
      _cacheParamsManager.updateData();
      inputState.add(null);
    }
  }

  String getPhoneNumber() => _appPreferences.getPhoneNumber();

  String getUserName() => _appPreferences.getUserDisplayName();

  String getUserRole() => _appPreferences.getUserRoleName();

  setFiscalYearLoginData(FiscalYearLoginData data) async {
    if (_cacheParamsManager.currentCompany != null) {
      _appPreferences.setCurrentFiscalYearDataLogin(jsonEncode(data.toJson()));
      _cacheParamsManager.currentFiscalYearLoginData = data;
      inputState.add(null);
      await _cacheParamsManager.updateData();
    }
    inputState.add(null);
  }

  logout() async {
    inputState.add(QuestionState(image: ImageAssets.clExit, message: "آیا می خواهید از سیستم خارج شوید؟", onAccept: (){
      _appPreferences.logout();
      _logOutStream.sink.add(null);
    }));
  }

  onSelectModule(KiaSystemModule module, bool isActive) {
    if (isActive) {
      if (_cacheParamsManager.currentCompany != null &&
          _cacheParamsManager.currentFiscalYearLoginData != null) {
        _navigatorStream.add(module);
      } else {
        inputState.add(ErrorState(message: "سال مالی یا شرکت نامعتبر است"));
      }
    } else {
      inputState.add(ErrorState(message: "شما این ماژول را ندارید"));
    }
  }

  List<ModuleItemData> getModulesList() {
    final List<ModuleItemData> list = [];
    final List<ModuleItemData> list1 = [];
    if (_cacheParamsManager.currentCompany != null) {
      var item = ModuleItemData(
          "بتن آماده",
          ImageAssets.clConcrete,
          KiaSystemModule.concrete,
          _cacheParamsManager.currentCompany!.concreteAccess);
      item.isActive ? list.add(item) : list1.add(item);
      item = ModuleItemData("فروش", ImageAssets.clSell, KiaSystemModule.sale,
          _cacheParamsManager.currentCompany!.saleAccess);
      item.isActive ? list.add(item) : list1.add(item);
      item = ModuleItemData(
          "خزانه",
          ImageAssets.clTreasury,
          KiaSystemModule.treasury,
          _cacheParamsManager.currentCompany!.treasuryAccess);
      item.isActive ? list.add(item) : list1.add(item);
      item = ModuleItemData(
          "مالی",
          ImageAssets.clFinancial,
          KiaSystemModule.finance,
          _cacheParamsManager.currentCompany!.accountingAccess);
      item.isActive ? list.add(item) : list1.add(item);
      // item = ModuleItemData(
      //     "انبار",
      //     ImageAssets.clFactory,
      //     KiaSystemModule.material,
      //     _cacheParamsManager.currentCompany!.storeAccess);
      // item.isActive ? list.add(item) : list1.add(item);
      // item = ModuleItemData(
      //     "حقوق و دستمزد",
      //     ImageAssets.clFactory,
      //     KiaSystemModule.material,
      //     _cacheParamsManager.currentCompany!.salaryAccess);
      // item.isActive ? list.add(item) : list1.add(item);
      // item = ModuleItemData(
      //     "گزارش",
      //     ImageAssets.clReport,
      //     KiaSystemModule.material,
      //     _cacheParamsManager.currentCompany!.sanadAccess);
      // item.isActive ? list.add(item) : list1.add(item);
      item = ModuleItemData(
          "باسکول",
          ImageAssets.clBascule,
          KiaSystemModule.bascule,
          _cacheParamsManager.currentCompany!.weightAccess);
      item.isActive ? list.add(item) : list1.add(item);
      item = ModuleItemData(
          "باسکول پیشرفته",
          ImageAssets.clTruckScale,
          KiaSystemModule.material,
          _cacheParamsManager.currentCompany!.sandAccess);
      item.isActive ? list.add(item) : list1.add(item);
      item = ModuleItemData(
          "پلاک خوان",
          ImageAssets.clCamera,
          KiaSystemModule.plate,
          _cacheParamsManager.currentCompany!.plateReaderAccess);
      item.isActive ? list.add(item) : list1.add(item);
      item = ModuleItemData(
          "مدیریت",
          ImageAssets.clManager,
          KiaSystemModule.managerModule,
          _cacheParamsManager.currentCompany!.managementAccess);
      item.isActive ? list.add(item) : list1.add(item);

      list.addAll(list1);
    }
    return list;
  }

  @override
  Stream<void> get accessListChangeOutput => _accessListChangeStream.stream;

  @override
  Sink get accessListChangeInput => _accessListChangeStream.sink;

  @override
  Stream<void> get companyChangeOutput => _companyChangeStream.stream;

  @override
  Sink get companyChangeInput => _companyChangeStream.sink;

  @override
  Stream<void> get fiscalYearChangeOutput => _fiscalYearChangeStream.stream;

  @override
  Stream<void> get logOutStreamOutput => _logOutStream.stream;

  @override
  Stream<KiaSystemModule> get navigatorStreamOutput => _navigatorStream.stream;

  @override
  Sink get fiscalYearChangeInput => _fiscalYearChangeStream.sink;
}

abstract class HomeViewModelOutputs {
  Stream<void> get accessListChangeOutput;

  Stream<void> get companyChangeOutput;

  Stream<void> get fiscalYearChangeOutput;

  Stream<void> get logOutStreamOutput;

  Stream<KiaSystemModule> get navigatorStreamOutput;
}

abstract class HomeViewModelInputs {
  Sink get accessListChangeInput;

  Sink get companyChangeInput;

  Sink get fiscalYearChangeInput;
}

class ModuleItemData {
  String title;
  KiaSystemModule module;
  String assetIcon;
  bool isActive;

  ModuleItemData(this.title, this.assetIcon, this.module, this.isActive);
}
