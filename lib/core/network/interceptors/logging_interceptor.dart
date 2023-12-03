import 'package:coptix/core/app_logger.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  final AppLogger logger = AppLogger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln('Request:');
    stringBuffer.writeln('URL: ${options.uri.toString()}');
    stringBuffer.writeln('Headers: ${options.headers}');
    stringBuffer.writeln('Body: ${options.data}');
    logger.w(stringBuffer);

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln('Response:');
    stringBuffer.writeln('URL: ${response.realUri.toString()}');
    stringBuffer.writeln('Headers: ${response.headers}');
    stringBuffer.writeln('Status: ${response.statusCode}');
    logger.t(stringBuffer);
    logger.t('Body: ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln('Error:');
    stringBuffer.writeln('URL: ${err.requestOptions.uri.toString()}');
    stringBuffer.writeln('Headers: ${err.requestOptions.headers}');
    stringBuffer.writeln('Error: ${err.response}');
    logger.e(stringBuffer);
    return handler.next(err);
  }
}
