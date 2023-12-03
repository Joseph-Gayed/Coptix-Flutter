import 'package:coptix/shared/utils/shared_preferences.dart';
import 'package:dio/dio.dart';


class HeadersInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await addLanguage(options);
    return handler.next(options);
  }

  Future<void> addLanguage(RequestOptions options) async {
    final language = await SharedPreferencesUtils.getLanguage();
    options.headers.addAll({"Accept-Language": language});
  }
}
