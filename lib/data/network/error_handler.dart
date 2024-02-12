import 'package:dio/dio.dart';
import '/data/network/failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
  NOT_REGISTRED, BAD_CERTIFICATE, CONNECTION_ERROR,
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error){
    if(error is DioException){
      failure = _handleError(error);
    }else{
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch(error.type){
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        switch(error.response?.statusCode){
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.unknown:
        return DataSource.DEFAULT.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.BAD_CERTIFICATE.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.CONNECTION_ERROR.getFailure();
    }
  }
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // API status code
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure, user is not authorised
  static const int NOT_FOUND = 404; // failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash happend in server side

  // locale status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECIEVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;

}

class ResponseMessage {
  // API status code
  static const String SUCCESS = "درخواست با موفقیت انجام شد."; // success with data
  static const String NO_CONTENT =
      "درخواست با موفقیت انجام شد."; // success with no data
  static const String BAD_REQUEST =
      "درخواست اشتباه، لطفا بعدا تلاش کنید."; // failure, api rejected the request
  static const String FORBIDDEN =
      "شما اجازه دسترسی ندارید!"; // failure, api rejected the request
  static const String UNAUTHORISED =
      "خطای احراز هویت، لطفا بعدا تلاش کنید."; // failure, user is not authorised
  static const String NOT_FOUND =
      "آدرس یافت نشد! لطفا بعدا تلاش کنید."; // failure, api url is not correct and not found
  static const String INTERNAL_SERVER_ERROR =
      "مشکلی رخ داده، لطفا بعدا تلاش کنید."; // failure, crash happened in server side

  // locale status code
  static const String DEFAULT = "مشکلی رخ داده، لطفا بعدا تلاش کنید.";
  static const String CONNECT_TIMEOUT = "عدم دریافت پاسخ از سرور، لطفا بعدا تلاش کنید.";
  static const String CANCEL = "درخواست لغو شد. لطفا بعدا تلاش کنید.";
  static const String RECIEVE_TIMEOUT = "عدم دریافت پاسخ از سرور، لطفا بعدا تلاش کنید.";
  static const String SEND_TIMEOUT = "عدم دریافت پاسخ از سرور، لطفا بعدا تلاش کنید.";
  static const String CACHE_ERROR = "مشکل در بازیابی اطلاعات، لطفا بعدا تلاش کنید.";
  static const String NO_INTERNET_CONNECTION =
      "خطای اتصال به اینترنت! لطفا اتصال به اینترنت را بررسی نمائید.";
}

class ApiInternalStatus{
  static const int  SUCCESS = 0;
  static const int  FAILURE = 1;
  static const int  INCORRECT_USERNAME_OR_PASSWORD = 2;
}