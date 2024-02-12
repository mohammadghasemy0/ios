import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part "japo_api_response.g.dart";

@JsonSerializable()
class AppLoginResponse {
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "userRole")
  int? userRole;
  @JsonKey(name: "isAuthenticated")
  bool? isAuthenticated;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "refreshToken")
  String? refreshToken;
  @JsonKey(name: "userRoleName")
  String? userRoleName;
  @JsonKey(name: "userDisplayName")
  String? userDisplayName;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "profileImage")
  String? profileImage;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;

  AppLoginResponse(
      this.userId,
      this.userRole,
      this.isAuthenticated,
      this.token,
      this.refreshToken,
      this.userRoleName,
      this.userDisplayName,
      this.message,
      this.profileImage,
      this.phoneNumber);

  factory AppLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$AppLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppLoginResponseToJson(this);
}

@JsonSerializable()
class SendVerificationCodeResponse {
  @JsonKey(name: "allowGoNextStep")
  bool? allowGoNextStep;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "operationResult")
  String? operationResult;

  SendVerificationCodeResponse(
      this.allowGoNextStep, this.message, this.operationResult);

  factory SendVerificationCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendVerificationCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendVerificationCodeResponseToJson(this);
}

@JsonSerializable()
class KianoAccessListResponse {
  @JsonKey(name: "hasAccessedCompany")
  final bool hasAccessedCompany;
  @JsonKey(name: "operation")
  final String operation;
  @JsonKey(name: "accessList")
  final List<AccessListCompanyItemResponse> accessList;

  KianoAccessListResponse(
      this.hasAccessedCompany, this.operation, this.accessList);

  factory KianoAccessListResponse.fromJson(Map<String, dynamic> json) =>
      _$KianoAccessListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KianoAccessListResponseToJson(this);
}

@JsonSerializable()
class AccessListCompanyItemResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "customerId")
  final int customerId;
  @JsonKey(name: "customerName")
  final String customerName;
  @JsonKey(name: "serverAddress")
  final String serverAddress;
  @JsonKey(name: "serverPassword")
  final String serverPassword;
  @JsonKey(name: "serverDbName")
  final String serverDbName;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "accountingAccess")
  final bool accountingAccess;
  @JsonKey(name: "treasuryAccess")
  final bool treasuryAccess;
  @JsonKey(name: "saleAccess")
  final bool saleAccess;
  @JsonKey(name: "storeAccess")
  final bool storeAccess;
  @JsonKey(name: "salaryAccess")
  final bool salaryAccess;
  @JsonKey(name: "concreteAccess")
  final bool concreteAccess;
  @JsonKey(name: "sanadAccess")
  final bool sanadAccess;
  @JsonKey(name: "weightAccess")
  final bool weightAccess;
  @JsonKey(name: "plateReaderAccess")
  final bool plateReaderAccess;
  @JsonKey(name: "sandAccess")
  final bool sandAccess;
  @JsonKey(name: "managementAccess")
  final bool managementAccess;

  AccessListCompanyItemResponse(
      this.id,
      this.customerId,
      this.customerName,
      this.serverAddress,
      this.serverPassword,
      this.serverDbName,
      this.description,
      this.accountingAccess,
      this.treasuryAccess,
      this.saleAccess,
      this.storeAccess,
      this.salaryAccess,
      this.concreteAccess,
      this.sanadAccess,
      this.weightAccess,
      this.plateReaderAccess,
      this.sandAccess,
      this.managementAccess);

  factory AccessListCompanyItemResponse.fromJson(Map<String, dynamic> json) =>
      _$AccessListCompanyItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccessListCompanyItemResponseToJson(this);
}