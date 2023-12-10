import 'package:coptix/core/network/error_handling/status_codes.dart';
import 'package:dio/dio.dart';

import '../base_api_response.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = StatusCode.unKnownError.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return StatusCode.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return StatusCode.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return StatusCode.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
            code: error.response?.statusCode ?? 0,
            message: error.response?.data["message"] ?? "");
      } else {
        return StatusCode.unKnownError.getFailure();
      }
    case DioExceptionType.cancel:
      return StatusCode.cancel.getFailure();
    default:
      return StatusCode.unKnownError.getFailure();
  }
}

Failure getResponseFailure(
    Response<dynamic> response, BaseApiResponse apiResponse) {
  Failure failure;
  if ((response.statusMessage ?? "").isNotEmpty) {
    failure = Failure(
        code: response.statusCode ?? StatusCode.unKnownError,
        message: apiResponse.message);
  } else {
    failure = (response.statusCode ?? StatusCode.unKnownError).getFailure();
  }
  return failure;
}
