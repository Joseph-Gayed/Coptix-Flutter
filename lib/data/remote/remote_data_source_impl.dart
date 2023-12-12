import 'package:coptix/core/network/api_names.dart';
import 'package:coptix/core/network/base_api_response.dart';
import 'package:coptix/core/network/error_handling/status_codes.dart';
import 'package:coptix/domain/model/details_request_params.dart';
import 'package:coptix/domain/model/domain_category.dart';
import 'package:coptix/domain/model/domain_clip.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/network/error_handling/failure.dart';
import '../../core/network/error_handling/error_handler.dart';
import '../../core/network/network_info.dart';
import '../../domain/model/domain_collection.dart';
import '../model/cateories_api_response.dart';
import '../model/collections_api_response.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;
  final NetworkInfo networkInfo;

  RemoteDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<Failure, List<DomainCategory>>> getHomeCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(ApiNames.categories);
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
        if (response.statusCode == StatusCode.success) {
          Map<String, dynamic> body = apiResponse.body as Map<String, dynamic>;
          CategoriesApiResponse categoriesApiResponse =
              CategoriesApiResponse.fromJson(body);

          return right(categoriesApiResponse.categories ?? []);
        }
        // Return Error
        Failure failure = getResponseFailure(response, apiResponse);
        return Left(failure);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(StatusCode.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<DomainCollection>>> getHomeCollections() async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(ApiNames.home);

        // Parse the response using the BaseApiResponse and HomeResponse classes
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
        if (response.statusCode == StatusCode.success) {
          // Return Success contains the collections
          Map<String, dynamic> body = apiResponse.body as Map<String, dynamic>;
          HomeCollectionsApiResponse homeApiResponse =
              HomeCollectionsApiResponse.fromJson(body);
          return right(homeApiResponse.collections ?? []);
        }
        // Return Error
        Failure failure = getResponseFailure(response, apiResponse);
        return Left(failure);
      } catch (e) {
        // Return Error
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(StatusCode.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, DomainClip>> getClipOrSeriesDetails(
      DetailsRequestParams request) async {
    if (await networkInfo.isConnected) {
      try {
        String detailsApiName = request.getApiName();
        if (!request.isValidRequest() || detailsApiName.isEmpty) {
          return Left(Failure(message: LocalizationKey.badRequest.tr()));
        }

        String path =
            "$detailsApiName/${request.contentType}/${request.contentId}";
        final Response response = await dio.get(path);

        // Parse the response using the BaseApiResponse and HomeResponse classes
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);

        if (response.statusCode == StatusCode.success) {
          var detailsApiResponse = DomainClip.fromJson(apiResponse.body);
          return right(detailsApiResponse);
        }

        Failure failure = getResponseFailure(response, apiResponse);
        return Left(failure);
      } catch (e) {
        // Return Error
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(StatusCode.noInternetConnection.getFailure());
    }
  }
}
