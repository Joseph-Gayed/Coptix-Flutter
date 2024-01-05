import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';

import '../../../shared/utils/localization/localized_content.dart';
import 'failure.dart';

class StatusCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthorised = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unKnownError = -7;
}

extension StatusCodeExtension on int {
  Failure getFailure() {
    switch (this) {
      case StatusCode.success:
        return Failure(
            code: StatusCode.success, message: LocalizationKey.success.tr());

      case StatusCode.noContent:
        return Failure(
            code: StatusCode.noContent,
            message: LocalizationKey.emptyContentMessage.tr());

      case StatusCode.badRequest:
        return Failure(
            code: StatusCode.badRequest,
            message: LocalizationKey.badRequest.tr());

      case StatusCode.forbidden:
        return Failure(
            code: StatusCode.forbidden,
            message: LocalizationKey.forbidden.tr());

      case StatusCode.unAuthorised:
        return Failure(
            code: StatusCode.unAuthorised,
            message: LocalizationKey.unAuthorised.tr());

      case StatusCode.notFound:
        return Failure(
            code: StatusCode.notFound, message: LocalizationKey.notFound.tr());

      case StatusCode.internalServerError:
        return Failure(
            code: StatusCode.internalServerError,
            message: LocalizationKey.internalServerError.tr());

      case StatusCode.connectTimeout:
        return Failure(
            code: StatusCode.connectTimeout,
            message: LocalizationKey.connectTimeout.tr());

      case StatusCode.cancel:
        return Failure(
            code: StatusCode.cancel, message: LocalizationKey.cancel.tr());

      case StatusCode.receiveTimeout:
        return Failure(
            code: StatusCode.receiveTimeout,
            message: LocalizationKey.receiveTimeout.tr());

      case StatusCode.sendTimeout:
        return Failure(
            code: StatusCode.sendTimeout,
            message: LocalizationKey.sendTimeout.tr());

      case StatusCode.cacheError:
        return Failure(
            code: StatusCode.cacheError,
            message: LocalizationKey.cacheError.tr());

      case StatusCode.noInternetConnection:
        return Failure(
            code: StatusCode.noInternetConnection,
            message: LocalizationKey.noInternetConnection.tr());

      default:
        return Failure(
            code: StatusCode.unKnownError,
            message: LocalizationKey.unKnownError.tr());
    }
  }
}
