import 'package:coptix/core/network/api_names.dart';
import 'package:coptix/core/network/base_api_response.dart';
import 'package:coptix/core/network/status_codes.dart';
import 'package:coptix/domain/model/details_request_params.dart';
import 'package:coptix/domain/model/domain_clip.dart';
import 'package:coptix/main.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/network/api_error.dart';
import '../../domain/model/domain_collection.dart';
import '../model/home_api_response.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<ApiException, List<DomainCollection>>>
      getHomeCollections() async {
    try {
      final Response response = await dio.get(ApiNames.home);

      // Parse the response using the BaseApiResponse and HomeResponse classes
      BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);
      if (response.statusCode == StatusCode.SUCCESS) {
        // Return Success contains the collections
        var homeApiResponse = HomeApiResponse.fromJson(apiResponse.body);
        return right(homeApiResponse.collections ?? []);
      }
      // Return Error
      return Left(ApiException(message: apiResponse.message));
    } catch (e) {
      // Return Error
      return Left(ApiException(message: e.toString()));
    }
  }

  @override
  Future<Either<ApiException, DomainClip>> getClipDetails(
      DetailsRequestParams request) async {
    try {
      if (!request.isValidRequest()) {
        return Left(ApiException(
            message: AppLocalizations.of(rootNavigatorKey.currentContext!)
                .translate(LocalizationKey.notFoundErrorMessage)));
      }

      String path =
          "${ApiNames.clipDetails}/${request.contentType}/${request.contentId}";
      final Response response = await dio.get(path);

      // Parse the response using the BaseApiResponse and HomeResponse classes
      BaseApiResponse apiResponse = BaseApiResponse.fromJson(response.data);

      if (response.statusCode == StatusCode.SUCCESS) {
        var detailsApiResponse = DomainClip.fromJson(apiResponse.body);
        return right(detailsApiResponse);
      }

      return Left(ApiException(message: apiResponse.message));
    } catch (e) {
      // Return Error
      return Left(ApiException(message: e.toString()));
    }
  }
}
