import 'dart:async';
import '../../common/state_renderer/state_renderer_test.dart';
import '/presentation/base/base_view_model.dart';
import '/domain/usecase/kiano_login/send_change_device_usecase.dart';
import '/domain/usecase/kiano_login/send_verification_code_usecase.dart';
import '/app/functions.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  final SendVerificationCodeUseCase _sendVerificationCodeUseCase;
  final SendChangeDeviceCodeUseCase _sendChangeDeviceCodeUseCase;

  final _phoneNumberStreamController = StreamController<String>.broadcast();
  final _nextStreamController = StreamController<bool>.broadcast();
  String phoneNumber = "";

  RegisterViewModel(
    this._sendVerificationCodeUseCase,
    this._sendChangeDeviceCodeUseCase,
  );

  @override
  void start() {
    inputState.add(null);
  }

  @override
  void dispose() {
    _phoneNumberStreamController.close();
    _nextStreamController.close();
    super.dispose();
  }

  @override
  register() async {
    inputState.add(LoadingState());
    (await _sendVerificationCodeUseCase.execute(phoneNumber))
        .fold((failure) => inputState.add(ErrorState(message: failure.message)),
            (success) async {
      inputState.add(null);
      if (success) {
        _nextStreamController.add(success);
      } else {
        await _sendChangeDeviceCode();
      }
    });
  }

  _sendChangeDeviceCode() async {
    inputState.add(LoadingState());
    (await _sendChangeDeviceCodeUseCase.execute(null))
        .fold((failure) => inputState.add(ErrorState(message: failure.message)),
            (success) {
      inputState.add(null);
      if (success) {
        _nextStreamController.add(success);
      } else {
        inputState.add(null);
      }
    });
  }

  @override
  setPhoneNumber(String phoneNumber) {
    phoneNumberInput.add(phoneNumber);
    this.phoneNumber = phoneNumber;
  }

  @override
  Sink get phoneNumberInput => _phoneNumberStreamController.sink;

  @override
  Sink get nextStreamInput => _nextStreamController.sink;

  @override
  Stream<bool> get isPhoneNumberValidOutput =>
      _phoneNumberStreamController.stream
          .map((phoneNumber) => isPhoneNumberValid(phoneNumber));

  @override
  Stream<bool> get nextStreamOutput => _nextStreamController.stream;
}

abstract class RegisterViewModelInputs {
  register();

  setPhoneNumber(String phoneNumber);

  Sink get phoneNumberInput;

  Sink get nextStreamInput;
}

abstract class RegisterViewModelOutputs {
  Stream<bool> get isPhoneNumberValidOutput;

  Stream<bool> get nextStreamOutput;
}
