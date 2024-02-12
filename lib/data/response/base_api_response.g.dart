// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseAPIResponse<T> _$BaseAPIResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseAPIResponse<T>(
      json['isOk'] as bool?,
      json['message'] as String?,
      _$nullableGenericFromJson(json['data'], fromJsonT),
    )..hasData = json['hasData'] as bool?;

Map<String, dynamic> _$BaseAPIResponseToJson<T>(
  BaseAPIResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'isOk': instance.isOk,
      'message': instance.message,
      'hasData': instance.hasData,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
