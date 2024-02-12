class AppLoginRequest {
  String phoneNumber;

  AppLoginRequest(this.phoneNumber);
}

class SendVerificationCodeRequest {
  String phoneNumber;
  String phoneModel;
  String macAddress;
  int deviceType;

  SendVerificationCodeRequest(
      this.phoneNumber, this.phoneModel, this.macAddress, this.deviceType);
}

class CheckConfirmCodeRequest {
  String phoneNumber;
  String verificationCode;

  CheckConfirmCodeRequest(this.phoneNumber, this.verificationCode);
}

class SendChangeDeviceCodeRequest {
  String phoneNumber;
  String macAddress;
  String deviceName;
  int deviceType;

  SendChangeDeviceCodeRequest(
      this.phoneNumber, this.macAddress, this.deviceName, this.deviceType);
}
