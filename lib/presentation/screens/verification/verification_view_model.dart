import 'dart:async';
import '../../common/state_renderer/state_renderer_test.dart';
import '/presentation/base/base_view_model.dart';
import '/domain/usecase/kiano_login/check_confirm_code_usecase.dart';
import '/domain/usecase/kiano_login/kiano_login_usecase.dart';

class VerificationViewModel extends BaseViewModel
    with VerificationViewModelInputs, VerificationViewModelOutputs {
  final CheckConfirmCodeUseCase _checkConfirmCodeUseCase;
  final KianoLoginUseCase _kianoLoginUseCase;

  VerificationViewModel(this._checkConfirmCodeUseCase, this._kianoLoginUseCase);

  final _verificationCodeStreamController =
      StreamController<String>.broadcast();
  final _nextStreamController = StreamController<bool>.broadcast();
  String code = "";
  late Timer timer;
  bool isTimeOut = false;

  @override
  void start() {
    inputState.add(null);
  }

  @override
  void dispose() {
    _nextStreamController.close();
    _verificationCodeStreamController.close();
    super.dispose();
  }

  @override
  Stream<bool> get isValidCodeOutput => _verificationCodeStreamController.stream
      .map((code) => code.length > 3 ? true : false);

  @override
  Stream<bool> get nextOutput =>
      _nextStreamController.stream.map((event) => event);

  @override
  setVerification(String code) {
    verificationInput.add(code);
    this.code = code;
  }

  @override
  verification() async {
    inputState.add(LoadingState());
    (await _checkConfirmCodeUseCase.execute(code)).fold((failure) {
      inputState.add(ErrorState(message: failure.message, stateRendererType: StateRendererType.popup));
    }, (data) async {
      if (data) {
        await auth();
      } else {
        inputState.add(ErrorState(message: "خطا در ارتباط با سرور", stateRendererType: StateRendererType.popup));
      }
    });
  }

  @override
  auth() async {
    inputState.add(LoadingState());
    (await _kianoLoginUseCase.execute(null)).fold((failure) {
      inputState.add(ErrorState(message: failure.message, stateRendererType: StateRendererType.popup));
    }, (data) {
      if (data) {
        inputState.add(null);
        _nextStreamController.add(data);
      } else {
        inputState.add(ErrorState(message: "خطا در ارتباط با سرور!", stateRendererType: StateRendererType.popup));
      }
    });
  }

  @override
  Sink get verificationInput => _verificationCodeStreamController.sink;

  onTimeOut() {
    isTimeOut = true;
    inputState.add(null);
  }
}

abstract class VerificationViewModelInputs {
  verification();

  auth();

  setVerification(String code);

  Sink get verificationInput;
}

abstract class VerificationViewModelOutputs {
  Stream<bool> get isValidCodeOutput;

  Stream<bool> get nextOutput;
}
