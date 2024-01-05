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
import '../../domain/model/domain_paginated_clips.dart';
import '../../domain/model/domain_collection.dart';
import '../../domain/model/search_request_params.dart';
import '../model/categories_api_response.dart';
import '../model/category_collections_api_response.dart';
import '../model/collections_api_response.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;
  final NetworkInfo networkInfo;

  RemoteDataSourceImpl({required this.dio, required this.networkInfo});

  Future<Either<Failure, T>> _executeRequest<T>(
    String apiUrl,
    Future<Response> Function() requestFunction,
    T Function(dynamic, Pagination? pagination) successHandler,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await requestFunction();
        BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);

        if (response.statusCode == StatusCode.success) {
          return right(
              successHandler(apiResponse.body, apiResponse.pagination));
        }

        Failure failure = getResponseFailure(response, apiResponse);
        return Left(failure);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(StatusCode.noInternetConnection.getFailure());
    }
  }

  Future<Either<Failure, DomainUser>> _performAuthentication(
    String apiUrl,
    AuthRequest request,
  ) async {
    return _executeRequest(
      apiUrl,
      () => dio.post(apiUrl, data: authRequestToJson(request)),
      (dynamic body, Pagination? pagination) {
        return DomainUser.fromJson(body as Map<String, dynamic>);
      },
    );
  }

  Future<Either<Failure, DomainPaginatedClips>> _getPaginatedClips(
      String apiUrl) async {
    return _executeRequest(
      apiUrl,
      () => dio.get(apiUrl),
      (dynamic body, Pagination? pagination) {
        if (body != null && body is List) {
          List<DomainClip> content =
              body.map((clipJson) => DomainClip.fromJson(clipJson)).toList();
          return DomainPaginatedClips(content: content, pagination: pagination);
        } else {
          return DomainPaginatedClips(content: [], pagination: pagination);
        }
      },
    );
  }

  @override
  Future<Either<Failure, DomainUser>> login(AuthRequest request) async {
    String apiUrl = ApiNames.login;
    return _performAuthentication(apiUrl, request);
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    String apiUrl = ApiNames.logout;

    return _executeRequest(
      apiUrl,
      () => dio.post(apiUrl),
      (dynamic body, Pagination? pagination) => body as bool,
    );
  }

  @override
  Future<Either<Failure, DomainUser>> signup(AuthRequest request) async {
    String apiUrl = ApiNames.signup;
    return _performAuthentication(apiUrl, request);
  }

  @override
  Future<Either<Failure, bool>> forgetPassword(AuthRequest request) async {
    String apiUrl = ApiNames.forgetPassword;

    return _executeRequest(
      apiUrl,
      () => dio.post(apiUrl, data: authRequestToJson(request)),
      (dynamic body, Pagination? pagination) => true,
    );
  }

  @override
  Future<Either<Failure, List<DomainCategory>>> getHomeCategories() async {
    String apiUrl = ApiNames.categories;

    return _executeRequest(
      apiUrl,
      () => dio.get(apiUrl),
      (dynamic body, Pagination? pagination) {
        CategoriesApiResponse categoriesApiResponse =
            CategoriesApiResponse.fromJson(body as Map<String, dynamic>);
        return categoriesApiResponse.categories ?? [];
      },
    );
  }

  @override
  Future<Either<Failure, List<DomainCollection>>> getCategoryCollections(
      String categoryId) async {
    String apiUrl = "${ApiNames.categories}/$categoryId";

    return _executeRequest(
      apiUrl,
      () => dio.get(apiUrl),
      (dynamic body, Pagination? pagination) {
        CategoryCollectionsApiResponse categoryDetailsApiResponse =
            CategoryCollectionsApiResponse.fromJson(
                body as Map<String, dynamic>);
        return categoryDetailsApiResponse.children ?? [];
      },
    );
  }

  @override
  Future<Either<Failure, DomainPaginatedClips>> getCategoryContent(
      CategoryContentRequest request) async {
    String apiUrl =
        "${ApiNames.categories}/${request.id}/${ApiNames.categoriesContent}?page=${request.page}";

    return _getPaginatedClips(apiUrl);
  }

  @override
  Future<Either<Failure, List<DomainCollection>>> getHomeCollections() async {
    String apiUrl = ApiNames.home;

    return _executeRequest(
      apiUrl,
      () => dio.get(apiUrl),
      (dynamic body, Pagination? pagination) {
        HomeCollectionsApiResponse homeApiResponse =
            HomeCollectionsApiResponse.fromJson(body as Map<String, dynamic>);
        return homeApiResponse.collections ?? [];
      },
    );
  }

  @override
  Future<Either<Failure, DomainClip>> getClipOrSeriesDetails(
      DetailsRequestParams request) async {
    String detailsApiName = request.getApiName();
    if (!request.isValidRequest() || detailsApiName.isEmpty) {
      return Left(Failure(message: LocalizationKey.badRequest.tr()));
    }

    String apiUrl =
        "$detailsApiName/${request.contentType}/${request.contentId}";

    return _executeRequest(
      apiUrl,
      () => dio.get(apiUrl),
      (dynamic body, Pagination? pagination) => DomainClip.fromJson(body),
    );
  }

  @override
  Future<Either<Failure, DomainPaginatedClips>> search(
      SearchRequest request) async {
    String apiUrl =
        "${ApiNames.search}?key=${request.keyword}&page=${request.page}&per_page=10";

    return _getPaginatedClips(apiUrl);
  }
}
