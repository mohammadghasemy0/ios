import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '/app/app_prefs.dart';
import '/app/constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String AUTHORIZATION = "authorization";
const String ACCEPT = "accept";
const String DEFAULT_LANGUAGE = "lang";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Dio getDio() {
    Dio dio = Dio();
    const Duration timeOut = Duration(milliseconds: 60 * 1000);
    String language = _appPreferences.getAppLanguage();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      // AUTHORIZATION: "",
      DEFAULT_LANGUAGE: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );

    if(kReleaseMode){
    }else {
      dio.interceptors.add(PrettyDioLogger(requestBody: true,requestHeader: true,responseHeader: true));
    }
    return dio;
  }
}