import 'dart:async';
import 'dart:convert';
import 'package:flutter/scheduler.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '/presentation/base/base_view_model.dart';
import '/data/network/error_handler.dart';
import '/domain/usecase/fiscal_year_db_auth.dart';
import '/domain/model/model.dart';
import '/app/app_prefs.dart';
import '/app/di.dart';
import '/domain/usecase/fiscal_year_list_usecase.dart';

class SelectFiscalYearViewModel extends BaseViewModel
    with SelectFiscalYearViewModelInputs, SelectFiscalYearViewModelOutputs {
  final FiscalYearListUseCase _fiscalYearListUseCase;
  final FiscalYearDataBaseAuthUseCase _fiscalYearDataBaseAuthUseCase;

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _fiscalYearListChangeStream = StreamController<void>.broadcast();
  final _loadingStream = StreamController<void>.broadcast();
  final _popUpStateStream = StreamController<bool>.broadcast();
  final _popUpCloseStream = StreamController<void>.broadcast();
  final _resultStream = StreamController<FiscalYearLoginData>();
  late final Company currentCompany;
  final List<FiscalYear> fiscalYearList = [];
  final List<FiscalYearLoginData> loginDataList = [];

  bool isLoading = false;

  SelectFiscalYearViewModel(
      this._fiscalYearListUseCase, this._fiscalYearDataBaseAuthUseCase);

  @override
  void start() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await getFiscalYearList();
      await getFiscalYearLoginDataList();
      fiscalYearChangeInput.add(null);
    });
  }

  @override
  void dispose() {
    _fiscalYearListChangeStream.close();
    _loadingStream.close();
    _popUpStateStream.close();
    _popUpCloseStream.close();
    _resultStream.close();
  }

  getFiscalYearList() async {
    inputState.add(LoadingState());
    (await _fiscalYearListUseCase.execute(currentCompany.serverAddress))
        .fold((l) => inputState.add(ErrorState(message: l.message)), (r) {
      fiscalYearList.clear();
      fiscalYearList.addAll(r);
      inputState.add(null);
    });
  }

  getFiscalYearLoginDataList() {
    final response = _appPreferences.getFiscalYearDataLoginList();
    if (response.isNotEmpty) {
      final json = jsonDecode(response) as List<dynamic>;

      loginDataList.clear();
      for (Map<String, dynamic> item in json) {
        loginDataList.add(FiscalYearLoginData.fromJson(item));
      }
    }
  }

  setFiscalYearLoginDataList() async {
    final List<Map<String, dynamic>> list = [];
    for (FiscalYearLoginData item in loginDataList) {
      list.add(item.toJson());
    }
    await _appPreferences.setFiscalYearDataLoginList(jsonEncode(list));
    fiscalYearChangeInput.add(null);
  }

  addFiscalYearLoginData(FiscalYearLoginData item) async {
    for (int i = 0; i < loginDataList.length; i++) {
      if (loginDataList[i].dbName == item.dbName) {
        loginDataList[i] = item;
        return;
      }
    }
    loginDataList.add(item);
    await setFiscalYearLoginDataList();
  }

  removeFiscalYearLoginData(FiscalYearLoginData item) async {
    for (int i = 0; i < loginDataList.length; i++) {
      if (loginDataList[i].dbName == item.dbName) {
        loginDataList.removeAt(i);
      }
    }
    await setFiscalYearLoginDataList();
  }

  bool isLoggedIn(FiscalYear item) {
    for (var i in loginDataList) {
      if (i.dbName == item.dbName) {
        return true;
      }
    }
    return false;
  }

  Future<void> selectFiscalYear(
      int index, Function(FiscalYear fiscalYear) showPopUp) async {
    if (!isLoading) {
      for (FiscalYearLoginData item in loginDataList) {
        if (item.dbName == fiscalYearList[index].dbName) {
          inputState.add(LoadingState());
          final result = await login(item);
          inputState.add(null);
          if (result ?? false) {
            resultStreamInput.add(item);
          } else if (result != null && !result) {
            showPopUp(fiscalYearList[index]);
          }
          return;
        }
      }
      showPopUp(fiscalYearList[index]);
    }
  }

  Future<bool?> login(FiscalYearLoginData loginData) async {
    isLoading = true;
    final result =
        (await _fiscalYearDataBaseAuthUseCase.execute(loginData)).fold((l) {
      if (l.code == ResponseCode.BAD_REQUEST) {
        inputState.add(ErrorState(
          message: "نام کاربری یا رمز عبور اشتباه است",
          stateRendererType: StateRendererType.popup,
        ));
        removeFiscalYearLoginData(loginData);
        return false;
      }
    }, (r) => r ? true : null);
    isLoading = false;
    return result;
  }

  registerFiscalYearLoginData(FiscalYearLoginData loginData) async {
    if (!isLoading) {
      final result = await login(loginData);
      if (result ?? false) {
        await addFiscalYearLoginData(loginData);
        popUpCloseStreamInput.add(null);
        resultStreamInput.add(loginData);
      } else if (result != null) {
        popUpStateStreamInput.add(false);
      }
    }
  }

  @override
  Sink get fiscalYearChangeInput => _fiscalYearListChangeStream.sink;

  @override
  Stream<void> get fiscalYearChangeOutput => _fiscalYearListChangeStream.stream;

  @override
  Sink get popUpStateStreamInput => _popUpStateStream.sink;

  @override
  Stream<bool> get popUpStateStreamOutput => _popUpStateStream.stream;

  @override
  Sink get popUpCloseStreamInput => _popUpCloseStream.sink;

  @override
  Stream<void> get popUpCloseStreamOutput => _popUpCloseStream.stream;

  @override
  Sink get resultStreamInput => _resultStream.sink;

  @override
  Stream<FiscalYearLoginData> get resultStreamOutput => _resultStream.stream;

  @override
  Sink get loadingStreamInput => _loadingStream.sink;

  @override
  Stream<void> get loadingStreamOutput => _loadingStream.stream;
}

abstract class SelectFiscalYearViewModelInputs {
  Sink get fiscalYearChangeInput;

  Sink get resultStreamInput;

  Sink get loadingStreamInput;

  Sink get popUpStateStreamInput;

  Sink get popUpCloseStreamInput;
}

abstract class SelectFiscalYearViewModelOutputs {
  Stream<void> get fiscalYearChangeOutput;

  Stream<FiscalYearLoginData> get resultStreamOutput;

  Stream<void> get loadingStreamOutput;

  Stream<bool> get popUpStateStreamOutput;

  Stream<void> get popUpCloseStreamOutput;
}
