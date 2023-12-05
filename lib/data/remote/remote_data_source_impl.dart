import 'package:coptix/core/network/api_names.dart';
import 'package:coptix/core/network/base_api_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

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
      debugPrint(response.data.toString());
      if (apiResponse.message.isNotEmpty) {
        // Return Error
        return Left(ApiException(message: apiResponse.message.join(", ")));
      }

      // Return Success contains the collections
      var homeApiResponse = HomeApiResponse.fromJson(apiResponse.body);
      // debugPrint(homeApiResponse.collections.toString());

      return right(homeApiResponse.collections ?? []);
    } catch (e) {
      // Return Error
      return Left(ApiException(message: e.toString()));
    }
  }
}
