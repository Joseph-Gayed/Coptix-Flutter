import 'package:coptix/core/network/interceptors/headers_interceptor.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../shared/utils/app_configurations.dart';
import 'api_names.dart';
import 'interceptors/caching_interceptor.dart';

//Singleton https://stackoverflow.com/a/55348216
class DioFactory {
  late Dio dioInstance;
  late Dio dioInstanceWithCache;

  Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
    "Accept-Language": LocalizationKey.defaultLanguage
  };

  DioFactory._privateConstructor() {
    dioInstance = initDioInstance();
    dioInstanceWithCache = initDioInstanceWithCache();
  }

  Dio initDioInstance() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiNames.baseUrl,
      receiveDataWhenStatusError: true,
      headers: headers,
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    Dio dioInstance = Dio(baseOptions);
    dioInstance.interceptors.add(HeadersInterceptor());

    if (enableApisLogging && !kReleaseMode) {
      // dioInstance.interceptors.add(LoggingInterceptor());
      dioInstance.interceptors.add(PrettyDioLogger(
        requestHeader: false,
        requestBody: false,
        responseBody: false,
      ));
    }
    return dioInstance;
  }

  Dio initDioInstanceWithCache() {
    Dio dioInstanceWithCache = initDioInstance();
    dioInstanceWithCache.interceptors.add(getCachingEnabledInterceptor());
    return dioInstanceWithCache;
  }

  static final DioFactory _instance = DioFactory._privateConstructor();

  static DioFactory get instance => _instance;

  factory DioFactory() {
    return _instance;
  }
}
