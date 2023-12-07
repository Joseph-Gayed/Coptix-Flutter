import 'package:dartz/dartz.dart';

import '../../../../../core/network/api_error.dart';
import '../../domain/model/details_request_params.dart';
import '../../domain/model/domain_clip.dart';
import '../../domain/model/domain_collection.dart';

abstract class RemoteDataSource {
  Future<Either<ApiException, List<DomainCollection>>> getHomeCollections();

  Future<Either<ApiException, DomainClip>> getClipOrSeriesDetails(
      DetailsRequestParams request);
}
