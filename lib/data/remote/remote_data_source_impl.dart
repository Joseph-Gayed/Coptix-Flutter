import 'package:coptix/core/network/api_names.dart';
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

import '../../core/network/error_handling/failure.dart';
import '../../core/network/network_manager.dart';
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
  final NetworkManager networkManager;

  RemoteDataSourceImpl({required this.dio, required this.networkManager});

  Future<Either<Failure, DomainUser>> _performAuthentication(
    String apiUrl,
    AuthRequest request,
  ) async {
    return networkManager.executeRequest(
      apiUrl,
      () => dio.post(apiUrl, data: authRequestToJson(request)),
      (dynamic body, Pagination? pagination) {
        return DomainUser.fromJson(body as Map<String, dynamic>);
      },
    );
  }

  Future<Either<Failure, DomainPaginatedClips>> _getPaginatedClips(
      String apiUrl) async {
    return networkManager.executeRequest(
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

    return networkManager.executeRequest(
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

    return networkManager.executeRequest(
      apiUrl,
      () => dio.post(apiUrl, data: authRequestToJson(request)),
      (dynamic body, Pagination? pagination) => true,
    );
  }

  @override
  Future<Either<Failure, List<DomainCategory>>> getHomeCategories() async {
    String apiUrl = ApiNames.categories;

    return networkManager.executeRequest(apiUrl, () => dio.get(apiUrl),
        (dynamic body, Pagination? pagination) {
      CategoriesApiResponse categoriesApiResponse =
          CategoriesApiResponse.fromJson(body as Map<String, dynamic>);
      return categoriesApiResponse.categories ?? [];
    }, useCache: true);
  }

  @override
  Future<Either<Failure, List<DomainCollection>>> getCategoryCollections(
      String categoryId) async {
    String apiUrl = "${ApiNames.categories}/$categoryId";

    return networkManager.executeRequest(
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

    return networkManager.executeRequest(apiUrl, () => dio.get(apiUrl),
        (dynamic body, Pagination? pagination) {
      HomeCollectionsApiResponse homeApiResponse =
          HomeCollectionsApiResponse.fromJson(body as Map<String, dynamic>);
      return homeApiResponse.collections ?? [];
    }, useCache: true);
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

    return networkManager.executeRequest(apiUrl, () => dio.get(apiUrl),
        (dynamic body, Pagination? pagination) => DomainClip.fromJson(body),
        useCache: true);
  }

  @override
  Future<Either<Failure, DomainPaginatedClips>> search(
      SearchRequest request) async {
    String apiUrl =
        "${ApiNames.search}?key=${request.keyword}&page=${request.page}&per_page=10";

    return _getPaginatedClips(apiUrl);
  }
}
