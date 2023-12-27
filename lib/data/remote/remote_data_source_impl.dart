import 'package:coptix/core/app_logger.dart';
import 'package:coptix/core/network/api_names.dart';
import 'package:coptix/core/network/base_api_response.dart';
import 'package:coptix/core/network/error_handling/status_codes.dart';
import 'package:coptix/core/network/pagination.dart';
import 'package:coptix/domain/model/auth_request_params.dart';
import 'package:coptix/domain/model/details_request_params.dart';
import 'package:coptix/domain/model/domain_category.dart';
import 'package:coptix/domain/model/domain_clip.dart';
import 'package:coptix/domain/model/domain_user.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/network/error_handling/error_handler.dart';
import '../../core/network/error_handling/failure.dart';
import '../../core/network/network_info.dart';
import '../../domain/model/category_content_request_params.dart';
import '../../domain/model/domain_category_content.dart';
import '../../domain/model/domain_collection.dart';
import '../model/categories_api_response.dart';
import '../model/category_collections_api_response.dart';
import '../model/collections_api_response.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;
  final NetworkInfo networkInfo;

  RemoteDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<Failure, DomainUser>> login(AuthRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response =
            await dio.post(ApiNames.login, data: authRequestToJson(request));
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
        if (response.statusCode == StatusCode.success) {
          Map<String, dynamic> body = apiResponse.body as Map<String, dynamic>;
          return right(DomainUser.fromJson(body));
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
  Future<Either<Failure, DomainUser>> signup(AuthRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response =
            await dio.post(ApiNames.signup, data: authRequestToJson(request));
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
        if (response.statusCode == StatusCode.success) {
          Map<String, dynamic> body = apiResponse.body as Map<String, dynamic>;
          return right(DomainUser.fromJson(body));
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
  Future<Either<Failure, bool>> forgetPassword(AuthRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.post(ApiNames.forgetPassword,
            data: authRequestToJson(request));
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
        if (response.statusCode == StatusCode.success) {
          return right(true);
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
        AppLogger().e("getHomeCategories: $e");
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(StatusCode.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<DomainCollection>>> getCategoryCollections(
      String categoryId) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response =
            await dio.get("${ApiNames.categories}/$categoryId");

        // Parse the response using the BaseApiResponse and HomeResponse classes
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
        if (response.statusCode == StatusCode.success) {
          // Return Success contains the collections
          Map<String, dynamic> body = apiResponse.body as Map<String, dynamic>;
          CategoryCollectionsApiResponse categoryDetailsApiResponseApiResponse =
              CategoryCollectionsApiResponse.fromJson(body);
          return right(categoryDetailsApiResponseApiResponse.children ?? []);
        }
        // Return Error
        Failure failure = getResponseFailure(response, apiResponse);
        return Left(failure);
      } catch (e) {
        AppLogger().e("getCategoryCollections: $e");

        // Return Error
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(StatusCode.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, DomainCategoryContent>> getCategoryContent(
      CategoryContentRequest request) async {
    String url =
        "${ApiNames.categories}/${request.id}/${ApiNames.categoriesContent}?page= ${request.page}";

    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(url);

        // Parse the response using the BaseApiResponse and HomeResponse classes
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
        if (response.statusCode == StatusCode.success) {
          List body = apiResponse.body as List;
          Pagination? pagination = apiResponse.pagination;
          List<DomainClip> content = [];
          content =
              body.map((clipJson) => DomainClip.fromJson(clipJson)).toList();

          return right(
              DomainCategoryContent(content: content, pagination: pagination));
        }

        // Return Error
        Failure failure = getResponseFailure(response, apiResponse);
        return Left(failure);
      } catch (e) {
        AppLogger().e("getCategoryContent: $e");

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
        AppLogger().e("getHomeCollections: $e");

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

//todo: enhance the repeated code :
/*
if (await networkInfo.isConnected) {
  try{
      final Response response = await dio.BLA_BLA_BLA;
      BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
      if (response.statusCode == StatusCode.success) {
        Map<String, dynamic> body = apiResponse.body as Map<String, dynamic>;
        return right(BLA_BLA_BLA);
      }

      // Return Error
      Failure failure = getResponseFailure(response, apiResponse);
      return Left(failure);
    }
  catch (e) {
    return Left(ErrorHandler.handle(e).failure);
  }
}else{
  return Left(StatusCode.noInternetConnection.getFailure());
}
*/
