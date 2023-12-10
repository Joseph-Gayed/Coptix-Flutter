import 'package:coptix/domain/model/domain_clip.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/error_handling/failure.dart';
import '../../domain/model/domain_collection.dart';
import '../model/details_request_params.dart';

abstract class ContentRepository {
  Future<Either<Failure, List<DomainCollection>>> getHomeCollections();
  Future<Either<Failure, DomainClip>> getClipDetails(
      DetailsRequestParams request);
  Future<Either<Failure, DomainClip>> getSeriesDetails(
      DetailsRequestParams request);
}
