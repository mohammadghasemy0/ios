import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:kiano/app/persian_date_time.dart';
import 'package:kiano/data/request/customer_api_request.dart';
import '/presentation/screens/filter_screen/filter_field/check_box/check_box_filter_field.dart';
import '/presentation/screens/filter_screen/filter_field/date_picker/date_picker_filter_filter.dart';
import '/domain/usecase/management/get_hesab_lock_conditions_usecase.dart';
import '/domain/usecase/management/management_lock_hesab_usecase.dart';
import '/domain/usecase/management/set_hesab_lock_conditions_usecase.dart';
import '/presentation/base/base_view_model.dart';
import '/app/di.dart';
import '../../common/cache_params.dart';

class LockHesabViewModel extends BaseViewModel {
  final cacheParams = instance<CacheParamsManager>();
  final GetHesabLockConditionsUseCase _getLockHesabUsecase;
  final SetHesabLockConditionsUseCase _setLockHesabUsecase;
  final ManagementLockHesabUseCase _lockHesabUsecase;
  LockHesabViewModel(this._getLockHesabUsecase, this._setLockHesabUsecase,
      this._lockHesabUsecase);

  int _prioud = 0;
  final _prioudStreamController = StreamController<String>.broadcast();
  final date = DatePickerFilterField();
  late final CheckBoxFilterField checkBox;

  @override
  void start() async {
    checkBox = CheckBoxFilterField(
        title: 'قفل کردن حساب ها به صورت اتومات',
        value: true,
        onChange: onChangeValue,

    );
    await getLockHesabExecute();
  }

  Future<void> getLockHesabExecute() async {
    (await _getLockHesabUsecase
            .execute(cacheParams.currentFiscalYearLoginData!.dbName))
        .fold((l) => null, (r) {
      try {
        date.value = PersianDateTime.fromString(r.lockDate);
        checkBox.value = r.lockAutomatic;
        _prioud = r.lockDayLength;
        inputState.add(null);
      } catch (error) {
        rethrow;
      }
    });
  }

  Future<void> setLockHesabExecute() async {
    (await _setLockHesabUsecase.execute(
      ManagementSetHesabLockConditionsRequest(
          date.value.toString(),
          checkBox.value,
          _prioud,
          cacheParams.currentFiscalYearLoginData!.dbName),
    ))
        .fold((l) => null, (r) {});
  }

  Future<void> lockHesabExecute() async {
    (await _lockHesabUsecase.execute(
      ManagementLockHesabRequest(
          date.value.toString(),
          cacheParams.currentFiscalYearLoginData!.dbName),
    ))
        .fold((l) => null, (r) {

    });
  }

  bool validation() {
    return true;
  }

  void onChangeValue(bool value) {
    inputState.add(null);
  }

  Stream<String> get prioudStream => _prioudStreamController.stream;

  void onChangePrioud(String prioud) {
    _prioud = int.parse(prioud);
  }

  onTap(BuildContext context) async{
    await setLockHesabExecute();
  }
}
