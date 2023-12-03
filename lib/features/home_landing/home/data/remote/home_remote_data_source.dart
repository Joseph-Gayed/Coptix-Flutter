import 'package:dartz/dartz.dart';

import '../../../../../core/network/api_error.dart';
import '../../domain/model/domain_collection.dart';

abstract class HomeRemoteDataSource {
  Future<Either<ApiException, List<DomainCollection>>> getHomeCollections();
}
