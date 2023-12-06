import 'package:coptix/domain/model/domain_clip.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/network/api_error.dart';
import '../../domain/model/domain_collection.dart';
import '../model/details_request_params.dart';

abstract class ContentRepository {
  Future<Either<ApiException, List<DomainCollection>>> getHomeCollections();
  Future<Either<ApiException, DomainClip>> getClipDetails(
      DetailsRequestParams request);
}
