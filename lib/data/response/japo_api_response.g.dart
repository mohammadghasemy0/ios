// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'japo_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppLoginResponse _$AppLoginResponseFromJson(Map<String, dynamic> json) =>
    AppLoginResponse(
      json['userId'] as int?,
      json['userRole'] as int?,
      json['isAuthenticated'] as bool?,
      json['token'] as String?,
      json['refreshToken'] as String?,
      json['userRoleName'] as String?,
      json['userDisplayName'] as String?,
      json['message'] as String?,
      json['profileImage'] as String?,
      json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$AppLoginResponseToJson(AppLoginResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userRole': instance.userRole,
      'isAuthenticated': instance.isAuthenticated,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'userRoleName': instance.userRoleName,
      'userDisplayName': instance.userDisplayName,
      'message': instance.message,
      'profileImage': instance.profileImage,
      'phoneNumber': instance.phoneNumber,
    };

SendVerificationCodeResponse _$SendVerificationCodeResponseFromJson(
        Map<String, dynamic> json) =>
    SendVerificationCodeResponse(
      json['allowGoNextStep'] as bool?,
      json['message'] as String?,
      json['operationResult'] as String?,
    );

Map<String, dynamic> _$SendVerificationCodeResponseToJson(
        SendVerificationCodeResponse instance) =>
    <String, dynamic>{
      'allowGoNextStep': instance.allowGoNextStep,
      'message': instance.message,
      'operationResult': instance.operationResult,
    };

KianoAccessListResponse _$KianoAccessListResponseFromJson(
        Map<String, dynamic> json) =>
    KianoAccessListResponse(
      json['hasAccessedCompany'] as bool,
      json['operation'] as String,
      (json['accessList'] as List<dynamic>)
          .map((e) =>
              AccessListCompanyItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KianoAccessListResponseToJson(
        KianoAccessListResponse instance) =>
    <String, dynamic>{
      'hasAccessedCompany': instance.hasAccessedCompany,
      'operation': instance.operation,
      'accessList': instance.accessList,
    };

AccessListCompanyItemResponse _$AccessListCompanyItemResponseFromJson(
        Map<String, dynamic> json) =>
    AccessListCompanyItemResponse(
      json['id'] as int,
      json['customerId'] as int,
      json['customerName'] as String,
      json['serverAddress'] as String,
      json['serverPassword'] as String,
      json['serverDbName'] as String,
      json['description'] as String,
      json['accountingAccess'] as bool,
      json['treasuryAccess'] as bool,
      json['saleAccess'] as bool,
      json['storeAccess'] as bool,
      json['salaryAccess'] as bool,
      json['concreteAccess'] as bool,
      json['sanadAccess'] as bool,
      json['weightAccess'] as bool,
      json['plateReaderAccess'] as bool,
      json['sandAccess'] as bool,
      json['managementAccess'] as bool,
    );

Map<String, dynamic> _$AccessListCompanyItemResponseToJson(
        AccessListCompanyItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'serverAddress': instance.serverAddress,
      'serverPassword': instance.serverPassword,
      'serverDbName': instance.serverDbName,
      'description': instance.description,
      'accountingAccess': instance.accountingAccess,
      'treasuryAccess': instance.treasuryAccess,
      'saleAccess': instance.saleAccess,
      'storeAccess': instance.storeAccess,
      'salaryAccess': instance.salaryAccess,
      'concreteAccess': instance.concreteAccess,
      'sanadAccess': instance.sanadAccess,
      'weightAccess': instance.weightAccess,
      'plateReaderAccess': instance.plateReaderAccess,
      'sandAccess': instance.sandAccess,
      'managementAccess': instance.managementAccess,
    };
