import 'package:coptix/domain/model/details_request_params.dart';
import 'package:coptix/domain/model/domain_category.dart';
import 'package:coptix/domain/model/domain_clip.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/error_handling/failure.dart';
import '../../domain/model/domain_collection.dart';
import '../../domain/repository/content_repository.dart';
import '../remote/remote_data_source.dart';

class ContentRepositoryImpl extends ContentRepository {
  final RemoteDataSource remoteDataSource;

  ContentRepositoryImpl({required this.remoteDataSource});

  //TODO: Caching
  @override
  Future<Either<Failure, List<DomainCategory>>> getHomeCategories() {
    return remoteDataSource.getHomeCategories();
  }

  //TODO: Caching
  @override
  Future<Either<Failure, List<DomainCollection>>> getHomeCollections() {
    return remoteDataSource.getHomeCollections();
  }

  //TODO: Caching
  @override
  Future<Either<Failure, DomainClip>> getClipDetails(
      DetailsRequestParams request) {
    return remoteDataSource.getClipOrSeriesDetails(request);
  }

  //TODO: Caching
  @override
  Future<Either<Failure, DomainClip>> getSeriesDetails(
      DetailsRequestParams request) {
    return remoteDataSource.getClipOrSeriesDetails(request);
  }
}
