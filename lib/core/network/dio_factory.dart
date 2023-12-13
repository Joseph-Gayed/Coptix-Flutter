import 'package:coptix/core/network/interceptors/headers_interceptor.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../shared/utils/app_configurations.dart';
import 'api_names.dart';

//Singleton https://stackoverflow.com/a/55348216
class DioFactory {
  late Dio dioInstance;

  Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
    "Accept-Language": LocalizationKey.defaultLanguage
  };

  DioFactory._privateConstructor() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiNames.baseUrl,
      receiveDataWhenStatusError: true,
      headers: headers,
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dioInstance = Dio(baseOptions);
    dioInstance.interceptors.add(HeadersInterceptor());

    if (enableApisLogging && !kReleaseMode) {
      // dioInstance.interceptors.add(LoggingInterceptor());
      dioInstance.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ));
    }
  }

  static final DioFactory _instance = DioFactory._privateConstructor();

  static DioFactory get instance => _instance;

  factory DioFactory() {
    return _instance;
  }
}
