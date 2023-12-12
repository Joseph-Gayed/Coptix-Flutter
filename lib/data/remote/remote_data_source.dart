import 'package:dartz/dartz.dart';

import '../../core/network/error_handling/failure.dart';
import '../../domain/model/details_request_params.dart';
import '../../domain/model/domain_category.dart';
import '../../domain/model/domain_clip.dart';
import '../../domain/model/domain_collection.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<DomainCategory>>> getHomeCategories();
  Future<Either<Failure, List<DomainCollection>>> getHomeCollections();
  Future<Either<Failure, DomainClip>> getClipOrSeriesDetails(
      DetailsRequestParams request);
}
