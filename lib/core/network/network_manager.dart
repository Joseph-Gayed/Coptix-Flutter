import 'package:coptix/core/network/pagination.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'base_api_response.dart';
import 'dio_factory.dart';
import 'error_handling/error_handler.dart';
import 'error_handling/failure.dart';
import 'error_handling/status_codes.dart';
import 'network_info.dart';

class NetworkManager {
  final NetworkInfo networkInfo;

  NetworkManager(this.networkInfo);

  Future<Either<Failure, T>> executeRequest<T>(
    String apiUrl,
    Future<Response> Function() requestFunction,
    T Function(dynamic, Pagination? pagination) successHandler, {
    bool useCache = false,
  }) async {
    if (useCache) {
      return await _getCachedData(
          apiUrl: apiUrl,
          successHandler: successHandler,
          failureHandler: () async {
            return await getFreshData(apiUrl, requestFunction, successHandler);
          });
    } else {
      return await getFreshData(apiUrl, requestFunction, successHandler);
    }
  }

  Future<Either<Failure, T>> _getCachedData<T>({
    required String apiUrl,
    required T Function(dynamic, Pagination? pagination) successHandler,
    required Future<Either<Failure, T>> Function() failureHandler,
  }) async {
    try {
      // Check for cache data first if caching is enabled
      Dio dioInstance = DioFactory.instance.dioInstanceWithCache;
      Response cachedResponse = await dioInstance.get(apiUrl);
      BaseApiResponse cachedApiResponse =
          BaseApiResponse.fromJson(cachedResponse.data);

      return right(
          successHandler(cachedApiResponse.body, cachedApiResponse.pagination));
    } catch (e) {
      // If cache fetch fails, proceed to network call if possible

      return failureHandler.call();
    }
  }

  Future<Either<Failure, T>> getFreshData<T>(
    String apiUrl,
    Future<Response> Function() requestFunction,
    T Function(dynamic, Pagination? pagination) successHandler,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await requestFunction();
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);

        if (response.statusCode == StatusCode.success ||
            apiResponse.body != null) {
          return right(
              successHandler(apiResponse.body, apiResponse.pagination));
        }

        Failure failure = getResponseFailure(response, apiResponse);
        return Left(failure);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return await _getCachedData(
          apiUrl: apiUrl,
          successHandler: successHandler,
          failureHandler: () async {
            return Left(StatusCode.noInternetConnection.getFailure());
          });
    }
  }
}

//   Future<Either<Failure, T>> executeRequest<T>(
//     String apiUrl,
//     Future<Response> Function() requestFunction,
//     T Function(dynamic, Pagination? pagination) successHandler, {
//     bool useCache = false,
//   }) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final Response response = await requestFunction();
//         BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
//
//         if (response.statusCode == StatusCode.success ||
//             apiResponse.body != null) {
//           return right(
//               successHandler(apiResponse.body, apiResponse.pagination));
//         }
//
//         Failure failure = getResponseFailure(response, apiResponse);
//         return Left(failure);
//       } catch (e) {
//         return Left(ErrorHandler.handle(e).failure);
//       }
//     } else {
//       return Left(StatusCode.noInternetConnection.getFailure());
//     }
//   }
