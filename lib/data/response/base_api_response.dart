import 'package:json_annotation/json_annotation.dart';
part 'base_api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseAPIResponse<T> {
  @JsonKey(name: "isOk")
  bool? isOk;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "hasData")
  bool? hasData;
  @JsonKey(name: "data")
  T? data;

  BaseAPIResponse(this.isOk, this.message, this.data);

  factory BaseAPIResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseAPIResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseAPIResponseToJson(this, toJsonT);
}