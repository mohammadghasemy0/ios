// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiscalYearLoginData _$FiscalYearLoginDataFromJson(Map<String, dynamic> json) =>
    FiscalYearLoginData(
      json['username'] as String,
      json['password'] as String,
      json['dbName'] as String,
    );

Map<String, dynamic> _$FiscalYearLoginDataToJson(
        FiscalYearLoginData instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'dbName': instance.dbName,
    };
