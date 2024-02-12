// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'japo_app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _JapoAppServiceClient implements JapoAppServiceClient {
  _JapoAppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://api.sup.kiasystem.ir';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseAPIResponse<AppLoginResponse>> appLogin(String phoneNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'phoneNumber': phoneNumber};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<AppLoginResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/kiano/Auth/AppLogin',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<AppLoginResponse>.fromJson(
      _result.data!,
      (json) => AppLoginResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<SendVerificationCodeResponse>> sendVerificationCode(
    String phoneNumber,
    String phoneModel,
    String macAddress,
    int deviceType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'phoneNumber': phoneNumber,
      'phoneModel': phoneModel,
      'macAddress': macAddress,
      'deviceType': deviceType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<SendVerificationCodeResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/kiano/Users/SendVerificationCode',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<SendVerificationCodeResponse>.fromJson(
      _result.data!,
      (json) =>
          SendVerificationCodeResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<String>> checkConfirmCode(
    String phoneNumber,
    String verificationCode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'phoneNumber': phoneNumber,
      'verificationCode': verificationCode,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/kiano/Users/CheckConfirmCode',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<String>> sendChangeDeviceCode(
    String phoneNumber,
    String macAddress,
    String deviceName,
    int deviceType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'phoneNumber': phoneNumber,
      'macAddress': macAddress,
      'deviceName': deviceName,
      'deviceType': deviceType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/kiano/Users/SendChangeDeviceCode',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _KianoAppServiceClient implements KianoAppServiceClient {
  _KianoAppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://api.sup.kiasystem.ir';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseAPIResponse<KianoAccessListResponse>> getKianoAccessList(
      String phoneNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'PhoneNumber': phoneNumber};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<KianoAccessListResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Customers/GetKianoAccessList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<KianoAccessListResponse>.fromJson(
      _result.data!,
      (json) => KianoAccessListResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CustomerAppServiceClient implements CustomerAppServiceClient {
  _CustomerAppServiceClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseAPIResponse<List<FiscalYearResponse>>> getCompanyFiscalYear(
      String apiPass) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ApiPass': apiPass};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<FiscalYearResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Other/GetDbList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<List<FiscalYearResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<FiscalYearResponse>(
                  (i) => FiscalYearResponse.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<int> getCheckServer() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Other/CheckApi',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = _result.data!;
    return value;
  }

  @override
  Future<BaseAPIResponse<String>> dbAuth(
    String username,
    String password,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'password': password,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Other/DbAuth',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialBillRepResponse>>> materialBillRep(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int customerId,
    int costCenterId,
    int carId,
    String driverName,
    List<int> productIds,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'DbName': dbName,
      r'CustomerId': customerId,
      r'IdMarkazHazine': costCenterId,
      r'CarId': carId,
      r'DriverName': driverName,
      r'ProductIds': productIds,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<MaterialBillRepResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Material/Reports/Sale/DetailedReportByDate',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<List<MaterialBillRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialBillRepResponse>((i) =>
                  MaterialBillRepResponse.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialBillRepByProductResponse>>>
      materialBillRepByProduct(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
    List<int> productIds,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'DbName': dbName,
      r'IdMarkazHazine': costCenterId,
      r'ProductIds': productIds,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<MaterialBillRepByProductResponse>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Material/Reports/Sale/ReportByProduct',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value =
        BaseAPIResponse<List<MaterialBillRepByProductResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialBillRepByProductResponse>((i) =>
                  MaterialBillRepByProductResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialBillRepByCustomerResponse>>>
      materialBillRepByCustomer(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int customerId,
    int costCenterId,
    List<int> productIds,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromStrDate': persianFromStrDate,
      'persianToStrDate': persianToStrDate,
      'dbName': dbName,
      'sellerId': customerId,
      'idMarkazHazine': costCenterId,
      'productIds': productIds,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<MaterialBillRepByCustomerResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Material/Reports/Sale/ReportByCustomerAndProduct',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<MaterialBillRepByCustomerResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialBillRepByCustomerResponse>((i) =>
                  MaterialBillRepByCustomerResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialBillRepByCarResponse>>>
      materialBillRepByCar(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
    int customerId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'PersianFromStrDate': persianFromStrDate,
      'PersianToStrDate': persianToStrDate,
      'DbName': dbName,
      'IdMarkazHazine': costCenterId,
      'sellerId': customerId,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<MaterialBillRepByCarResponse>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Material/Reports/Sale/SaleByCar',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = BaseAPIResponse<List<MaterialBillRepByCarResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialBillRepByCarResponse>((i) =>
                  MaterialBillRepByCarResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialDetailedIncomingRepResponse>>>
      materialDetailedIncomingRep(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
    int carId,
    int customerId,
    List<int> productIds,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromStrDate': persianFromStrDate,
      'persianToStrDate': persianToStrDate,
      'dbName': dbName,
      'idMarkazHazine': costCenterId,
      'carId': carId,
      'sellerId': customerId,
      'productList': productIds,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<MaterialDetailedIncomingRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Material/Reports/Voroodi/VoroodiDetailedReport',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<MaterialDetailedIncomingRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialDetailedIncomingRepResponse>((i) =>
                  MaterialDetailedIncomingRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialIncomingRepByProductResponse>>>
      materialIncomingRepByProduct(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
    List<int> productIds,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromStrDate': persianFromStrDate,
      'persianToStrDate': persianToStrDate,
      'dbName': dbName,
      'idMarkazHazine': costCenterId,
      'productIds': productIds,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<MaterialIncomingRepByProductResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Material/Reports/Voroodi/VoroodiByKala',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<MaterialIncomingRepByProductResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialIncomingRepByProductResponse>((i) =>
                  MaterialIncomingRepByProductResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialIncomingRepByCarResponse>>>
      materialIncomingRepByCar(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
    int customerId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromStrDate': persianFromStrDate,
      'persianToStrDate': persianToStrDate,
      'dbName': dbName,
      'idMarkazHazine': costCenterId,
      'sellerId': customerId,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<MaterialIncomingRepByCarResponse>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Material/Reports/Voroodi/VoroodiByCar',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value =
        BaseAPIResponse<List<MaterialIncomingRepByCarResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialIncomingRepByCarResponse>((i) =>
                  MaterialIncomingRepByCarResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialIncomingRepByCustomerResponse>>>
      materialIncomingRepByCustomer(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
    int customerId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'PersianFromStrDate': persianFromStrDate,
      'PersianToStrDate': persianToStrDate,
      'DbName': dbName,
      'IdMarkazHazine': costCenterId,
      'sellerId': customerId,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<MaterialIncomingRepByCustomerResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Material/Reports/Voroodi/CumulativeReportBySeller',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<MaterialIncomingRepByCustomerResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialIncomingRepByCustomerResponse>((i) =>
                  MaterialIncomingRepByCustomerResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialIncomingRepByCustomerAndProductResponse>>>
      materialIncomingRepByCustomerAndProduct(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
    int customerId,
    List<int> productIds,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'PersianFromStrDate': persianFromStrDate,
      'PersianToStrDate': persianToStrDate,
      'DbName': dbName,
      'IdMarkazHazine': costCenterId,
      'sellerId': customerId,
      'productIds': productIds,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<
            List<MaterialIncomingRepByCustomerAndProductResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Material/Reports/Voroodi/ReportByCustomerAndProduct',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = BaseAPIResponse<
        List<MaterialIncomingRepByCustomerAndProductResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialIncomingRepByCustomerAndProductResponse>((i) =>
                  MaterialIncomingRepByCustomerAndProductResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialMineDailyRepResponse>>>
      materialMineDailyRep(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'DbName': dbName,
      r'IdMarkazHazine': costCenterId,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<MaterialMineDailyRepResponse>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Material/Reports/Mine/MineDailyReport',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = BaseAPIResponse<List<MaterialMineDailyRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialMineDailyRepResponse>((i) =>
                  MaterialMineDailyRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialMineMonthlyRepResponse>>>
      materialMineMonthlyRep(
    String year,
    String dbName,
    int costCenterId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Year': year,
      r'DbName': dbName,
      r'IdMarkazHazine': costCenterId,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<MaterialMineMonthlyRepResponse>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Material/Reports/Mine/MineMonthlyReport',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value =
        BaseAPIResponse<List<MaterialMineMonthlyRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialMineMonthlyRepResponse>((i) =>
                  MaterialMineMonthlyRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<MaterialMostCarrierRepResponse>>>
      materialMostCarrierRep(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'DbName': dbName,
      r'IdMarkazHazine': costCenterId,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<MaterialMostCarrierRepResponse>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Material/Reports/Mine/MostCarrierReport',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value =
        BaseAPIResponse<List<MaterialMostCarrierRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MaterialMostCarrierRepResponse>((i) =>
                  MaterialMostCarrierRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<MaterialMineTransportToSaleRatioReportResponse>>
      materialMineTransportToSaleRatioReport(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
    int costCenterId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'DbName': dbName,
      r'IdMarkazHazine': costCenterId,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            BaseAPIResponse<MaterialMineTransportToSaleRatioReportResponse>>(
        Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Material/Reports/Mine/TransportToSaleRatioReport',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<
        MaterialMineTransportToSaleRatioReportResponse>.fromJson(
      _result.data!,
      (json) => MaterialMineTransportToSaleRatioReportResponse.fromJson(
          json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<CacheParamsResponse>> getCacheParams(
    List<String> cacheKeys,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'cacheKeys': cacheKeys,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<CacheParamsResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/SharedParams/GetCacheParams',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<CacheParamsResponse>.fromJson(
      _result.data!,
      (json) => CacheParamsResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<TafsiliResponse>>> getHesabTafsiliList(
    List<int> idTaf,
    List<int> idGoroTaf,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'idTaf': idTaf,
      'idGoroTaf': idGoroTaf,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<TafsiliResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/SharedParams/GetHesabTafsiliList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<List<TafsiliResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<TafsiliResponse>(
                  (i) => TafsiliResponse.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<SaleDailySummaryRepResponse>> saleDailySummaryRep(
    String date,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Date': date,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<SaleDailySummaryRepResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Sale/Reports/Summary/DailySummaryReport',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<SaleDailySummaryRepResponse>.fromJson(
      _result.data!,
      (json) =>
          SaleDailySummaryRepResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<PlateDailySummaryRepResponse>> plateDailySummaryRep(
      String date) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'Date': date};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<PlateDailySummaryRepResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/PlateReader/reports/DailySummary',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<PlateDailySummaryRepResponse>.fromJson(
      _result.data!,
      (json) =>
          PlateDailySummaryRepResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<TreasuryDailySummaryRepResponse>>
      treasuryDailySummaryRep(
    String date,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianDate': date,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<TreasuryDailySummaryRepResponse>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Treasury/Reports/Summary/DailySummaryReport',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = BaseAPIResponse<TreasuryDailySummaryRepResponse>.fromJson(
      _result.data!,
      (json) => TreasuryDailySummaryRepResponse.fromJson(
          json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<FinanceDailySummaryRepResponse>>
      financeDailySummaryRep(
    String date,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Date': date,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<FinanceDailySummaryRepResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Finance/Reports/Summary/DailySummary',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<FinanceDailySummaryRepResponse>.fromJson(
      _result.data!,
      (json) =>
          FinanceDailySummaryRepResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<MaterialDailySummaryRepResponse>>
      materialDailySummaryRep(
    String date,
    String dbName,
    int costCenterId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Date': date,
      r'DbName': dbName,
      r'IdMarkazHazine': costCenterId,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<MaterialDailySummaryRepResponse>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Material/Reports/Summary/DailySummary',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = BaseAPIResponse<MaterialDailySummaryRepResponse>.fromJson(
      _result.data!,
      (json) => MaterialDailySummaryRepResponse.fromJson(
          json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<ConcreteDailySummaryRepResponse>>
      concreteDailySummaryRep(
    String date,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'Date': date,
      'DbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<ConcreteDailySummaryRepResponse>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Concrete/Reports/Summary/DailySummary',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = BaseAPIResponse<ConcreteDailySummaryRepResponse>.fromJson(
      _result.data!,
      (json) => ConcreteDailySummaryRepResponse.fromJson(
          json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<BasculeDailySummaryRepResponse>>
      basculeDailySummaryRep(
    String date,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Date': date,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<BasculeDailySummaryRepResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Bascule/Reports/Summary/DailySummaryReport',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<BasculeDailySummaryRepResponse>.fromJson(
      _result.data!,
      (json) =>
          BasculeDailySummaryRepResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>?>>
      treasuryDaryaftRep(
    String persianFromDate,
    String persianToDate,
    bool naghdi,
    bool havale,
    bool kart,
    bool check,
    int idPardakhtKonande,
    int idDaryaftKonande,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromDate': persianFromDate,
      'persianToDate': persianToDate,
      'naghdi': naghdi,
      'havale': havale,
      'kart': kart,
      'check': check,
      'idPardakhtKonande': idPardakhtKonande,
      'idDaryaftKonande': idDaryaftKonande,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Treasury/Reports/Other/Daryaft',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<TreasuryDaryaftAndPardakhtRepResponse>((i) =>
                  TreasuryDaryaftAndPardakhtRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<
          BaseAPIResponse<
              List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>?>>
      treasuryDaryaftBeTafkikHesabRep(
    String persianFromDate,
    String persianToDate,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromDate': persianFromDate,
      'persianToDate': persianToDate,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<
            List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Treasury/Reports/Other/DaryaftBeTafkikHesab',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = BaseAPIResponse<
        List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>((i) =>
                  TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>?>>
      treasuryGoTajmiDaryaftRep(
    String persianFromDate,
    String persianToDate,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromDate': persianFromDate,
      'persianToDate': persianToDate,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<
            List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Treasury/Reports/Other/GoTajmiDaryaft',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = BaseAPIResponse<
        List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>((i) =>
                  TreasuryGoTajmiDaryaftAndPardakhtRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>?>>
      treasuryGoTajmiPardakhtRep(
    String persianFromDate,
    String persianToDate,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromDate': persianFromDate,
      'persianToDate': persianToDate,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<
            List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Treasury/Reports/Other/GoTajmiPardakht',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = BaseAPIResponse<
        List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>((i) =>
                  TreasuryGoTajmiDaryaftAndPardakhtRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>?>>
      treasuryPardakhtRep(
    String persianFromDate,
    String persianToDate,
    String dbName,
    bool naghdi,
    bool havale,
    bool kart,
    bool check,
    int idPardakhtKonande,
    int idDaryaftKonande,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromDate': persianFromDate,
      'persianToDate': persianToDate,
      'dbName': dbName,
      'naghdi': naghdi,
      'havale': havale,
      'kart': kart,
      'check': check,
      'idPardakhtKonande': idPardakhtKonande,
      'idDaryaftKonande': idDaryaftKonande,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Treasury/Reports/Other/Pardakht',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<TreasuryDaryaftAndPardakhtRepResponse>((i) =>
                  TreasuryDaryaftAndPardakhtRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<
          BaseAPIResponse<
              List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>?>>
      treasuryPardakhtBeTafkikHesabRep(
    String persianFromDate,
    String persianToDate,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromDate': persianFromDate,
      'persianToDate': persianToDate,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<
            List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Treasury/Reports/Other/PardakhtBeTafkikHesab',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = BaseAPIResponse<
        List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>((i) =>
                  TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<FinancialBedBesResponse?>> financialBedBesReport(
    String persianFromStrDate,
    String persianToStrDate,
    List<int>? goroohTafsiliList,
    bool bedehkar,
    bool bestankar,
    bool bihesab,
    int bedFrom,
    int bedTo,
    int besFrom,
    int besTo,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'GoroohTafsiliList': goroohTafsiliList,
      r'Bedehkar': bedehkar,
      r'Bestankar': bestankar,
      r'Bihesab': bihesab,
      r'BedFrom': bedFrom,
      r'BedTo': bedTo,
      r'BesFrom': besFrom,
      r'BesTo': besTo,
      r'DbName': dbName,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<FinancialBedBesResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Finance/Reports/Financial/BedBesReport',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<FinancialBedBesResponse?>.fromJson(
      _result.data!,
      (json) => json == null
          ? null
          : FinancialBedBesResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<FinancialGozareshHesabRepResponse>?>>
      financialGozareshHesabReport(
    String persianFromStrDate,
    String persianToStrDate,
    int hesabTafsili,
    List<int> moinList,
    bool showMandeHesabGhabli,
    bool showRizFactor,
    bool showKerayeHaml,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'HesabTafsili': hesabTafsili,
      r'MoinList': moinList,
      r'ShowMandeHesabGhabli': showMandeHesabGhabli,
      r'ShowRizFactor': showRizFactor,
      r'ShowKerayeHaml': showKerayeHaml,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<FinancialGozareshHesabRepResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Finance/Reports/Financial/GozareshHesab',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<FinancialGozareshHesabRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<FinancialGozareshHesabRepResponse>((i) =>
                  FinancialGozareshHesabRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<ConcreteOrdersInDayRepResponse>?>>
      concreteOrdersInDayReport(
    String persianFromStrDate,
    String persianToStrDate,
    int workStatus,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'workStatus': workStatus,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<ConcreteOrdersInDayRepResponse>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Concrete/ConcreteOrder/GetOrdersInDay',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value =
        BaseAPIResponse<List<ConcreteOrdersInDayRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ConcreteOrdersInDayRepResponse>((i) =>
                  ConcreteOrdersInDayRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<ConcreteSaleDetailedRepResponse>?>>
      concreteSaleDetailedReport(
    String persianFromStrDate,
    String persianToStrDate,
    List<int> productIds,
    int customerId,
    int carId,
    String driverName,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromStrDate': persianFromStrDate,
      'persianToStrDate': persianToStrDate,
      'productIds': productIds,
      'customerId': customerId,
      'carId': carId,
      'driverName': driverName,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<ConcreteSaleDetailedRepResponse>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/Concrete/Reports/Customers/ConcreteSaleDetailedReport',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value =
        BaseAPIResponse<List<ConcreteSaleDetailedRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ConcreteSaleDetailedRepResponse>((i) =>
                  ConcreteSaleDetailedRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<ConcreteReportByCustomerAndProductResponse>?>>
      concreteReportByCustomerAndProduct(
    String persianFromStrDate,
    String persianToStrDate,
    List<int> productIds,
    int customerId,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'ProductIds': productIds,
      r'CustomerId': customerId,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            BaseAPIResponse<List<ConcreteReportByCustomerAndProductResponse>>>(
        Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Concrete/Reports/Customers/ReportByCustomerAndProduct',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<
        List<ConcreteReportByCustomerAndProductResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ConcreteReportByCustomerAndProductResponse>((i) =>
                  ConcreteReportByCustomerAndProductResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<ConcreteSalesByProductRepResponse>?>>
      concreteSalesByProductRep(
    String persianFromStrDate,
    String persianToStrDate,
    List<int> productIds,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromStrDate': persianFromStrDate,
      'persianToStrDate': persianToStrDate,
      'productIds': productIds,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<ConcreteSalesByProductRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Concrete/Reports/Sales/ByProduct',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<ConcreteSalesByProductRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ConcreteSalesByProductRepResponse>((i) =>
                  ConcreteSalesByProductRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<ConcreteSalesDailyTotaledRepResponse>?>>
      concreteSalesDailyTotaledRep(
    String persianFromStrDate,
    String persianToStrDate,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<ConcreteSalesDailyTotaledRepResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Concrete/Reports/Sales/DailyTotaled',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<ConcreteSalesDailyTotaledRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ConcreteSalesDailyTotaledRepResponse>((i) =>
                  ConcreteSalesDailyTotaledRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<ConcreteMixerDailyCumulativeRepResponse>?>>
      concreteMixerDailyCumulativeRep(
    String persianFromStrDate,
    String persianToStrDate,
    int carId,
    String driverName,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'CarId': carId,
      r'DriverName': driverName,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<ConcreteMixerDailyCumulativeRepResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Concrete/Reports/Mixer/DailyCumulativeReport',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<ConcreteMixerDailyCumulativeRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ConcreteMixerDailyCumulativeRepResponse>((i) =>
                  ConcreteMixerDailyCumulativeRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<ConcreteMixerDriverDetailedRepResponse>?>>
      concreteMixerDriverDetailedRep(
    String persianFromStrDate,
    String persianToStrDate,
    int customerId,
    String driverName,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PersianFromStrDate': persianFromStrDate,
      r'PersianToStrDate': persianToStrDate,
      r'CustomerId': customerId,
      r'DriverName': driverName,
      r'DbName': dbName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<ConcreteMixerDriverDetailedRepResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Concrete/Reports/Mixer/DriverDetailedReport',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<ConcreteMixerDriverDetailedRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ConcreteMixerDriverDetailedRepResponse>((i) =>
                  ConcreteMixerDriverDetailedRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<ConcretePompKarkardPompRepResponse>?>>
      concretePompKarkardPompRep(
    String persianFromStrDate,
    String persianToStrDate,
    int pompId,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianFromStrDate': persianFromStrDate,
      'persianToStrDate': persianToStrDate,
      'pompId': pompId,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<List<ConcretePompKarkardPompRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Concrete/Reports/Pomp/KarkardPomp',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<List<ConcretePompKarkardPompRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ConcretePompKarkardPompRepResponse>((i) =>
                  ConcretePompKarkardPompRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<String?>> managementLockHesab(
    String lockDate,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'lockDate': lockDate,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Management/LockHesab',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<String?>.fromJson(
      _result.data!,
      (json) => json as String?,
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<String?>> managementSetHesabLockConditions(
    String lockDate,
    bool lockAutomatic,
    int lockDayLength,
    String dbName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'lockDate': lockDate,
      'lockAutomatic': lockAutomatic,
      'lockDayLength': lockDayLength,
      'dbName': dbName,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Management/SetHesabLockConditions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<String?>.fromJson(
      _result.data!,
      (json) => json as String?,
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<String?>> concreteAddOrder(
    String persianDate,
    String time,
    String address,
    String workType,
    String dbName,
    int customerId,
    int productId,
    int pompId,
    double meghdar,
    double tolerance,
    int controlType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'persianDate': persianDate,
      'time': time,
      'address': address,
      'workType': workType,
      'dbName': dbName,
      'customerId': customerId,
      'productId': productId,
      'pompId': pompId,
      'meghdar': meghdar,
      'tolerance': tolerance,
      'controlType': controlType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Concrete/ConcreteOrder/AddOrder',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseAPIResponse<String?>.fromJson(
      _result.data!,
      (json) => json as String?,
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<ManagementGetHesabLockConditionsResponse>>
      managementGetHesabLockConditions(String dbName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'DbName': dbName};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<ManagementGetHesabLockConditionsResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/Management/GetHesabLockConditions',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        BaseAPIResponse<ManagementGetHesabLockConditionsResponse>.fromJson(
      _result.data!,
      (json) => ManagementGetHesabLockConditionsResponse.fromJson(
          json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<
          BaseAPIResponse<
              List<PlateReaderDailyTotaledAndTotaledRepRepResponse>?>>
      plateReaderDailyTotaledRep(
    String fromDate,
    String toDate,
    int p1,
    String p2,
    int p3,
    int p4,
    int instanceId,
    bool showReserves,
    int pageNumber,
    int pageSize,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'fromDate': fromDate,
      'toDate': toDate,
      'p1': p1,
      'p2': p2,
      'p3': p3,
      'p4': p4,
      'instanceId': instanceId,
      'showReserves': showReserves,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<
            List<PlateReaderDailyTotaledAndTotaledRepRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/PlateReader/reports/DailyTotaledReport',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = BaseAPIResponse<
        List<PlateReaderDailyTotaledAndTotaledRepRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<PlateReaderDailyTotaledAndTotaledRepRepResponse>((i) =>
                  PlateReaderDailyTotaledAndTotaledRepRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<PlateReaderDetailedRepResponse>?>>
      plateReaderDetailedRep(
    String fromDate,
    String toDate,
    int p1,
    String p2,
    int p3,
    int p4,
    int instanceId,
    bool showReserves,
    int pageNumber,
    int pageSize,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'fromDate': fromDate,
      'toDate': toDate,
      'p1': p1,
      'p2': p2,
      'p3': p3,
      'p4': p4,
      'instanceId': instanceId,
      'showReserves': showReserves,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<PlateReaderDetailedRepResponse>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/PlateReader/reports/DetailedReport',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value =
        BaseAPIResponse<List<PlateReaderDetailedRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<PlateReaderDetailedRepResponse>((i) =>
                  PlateReaderDetailedRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<
          BaseAPIResponse<
              List<PlateReaderDailyTotaledAndTotaledRepRepResponse>?>>
      plateReaderTotaledRep(
    String fromDate,
    String toDate,
    int p1,
    String p2,
    int p3,
    int p4,
    int instanceId,
    bool showReserves,
    int pageNumber,
    int pageSize,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'fromDate': fromDate,
      'toDate': toDate,
      'p1': p1,
      'p2': p2,
      'p3': p3,
      'p4': p4,
      'instanceId': instanceId,
      'showReserves': showReserves,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BaseAPIResponse<
            List<PlateReaderDailyTotaledAndTotaledRepRepResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/PlateReader/reports/TotaledReport',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = BaseAPIResponse<
        List<PlateReaderDailyTotaledAndTotaledRepRepResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<PlateReaderDailyTotaledAndTotaledRepRepResponse>((i) =>
                  PlateReaderDailyTotaledAndTotaledRepRepResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseAPIResponse<List<PlateReaderInstanceListResponse>?>>
      plateReaderGetInstanceList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseAPIResponse<List<PlateReaderInstanceListResponse>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/PlateReader/reports/GetInstanceList',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value =
        BaseAPIResponse<List<PlateReaderInstanceListResponse>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<PlateReaderInstanceListResponse>((i) =>
                  PlateReaderInstanceListResponse.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
