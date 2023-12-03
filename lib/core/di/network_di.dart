import 'package:coptix/core/network/interceptors/headers_interceptor.dart';
import 'package:coptix/core/network/interceptors/logging_interceptor.dart';
import 'package:dio/dio.dart';

import '../../core/network/api_names.dart';

//Singleton https://stackoverflow.com/a/55348216
class NetworkDi {
  late Dio dioInstance;

  NetworkDi._privateConstructor() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiNames.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dioInstance = Dio(baseOptions);
    dioInstance.interceptors.add(HeadersInterceptor());
    dioInstance.interceptors.add(LoggingInterceptor());
  }

  static final NetworkDi _instance = NetworkDi._privateConstructor();

  static NetworkDi get instance => _instance;

  factory NetworkDi() {
    return _instance;
  }
}
