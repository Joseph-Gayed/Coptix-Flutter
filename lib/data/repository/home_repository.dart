import 'package:dartz/dartz.dart';

import '../../../../../core/network/api_error.dart';
import '../../domain/model/domain_collection.dart';
import '../../domain/repository/home_repository.dart';
import '../remote/remote_data_source.dart';

class HomeRepositoryImpl extends HomeRepository {
  final RemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ApiException, List<DomainCollection>>> getHomeCollections() {
    return remoteDataSource.getHomeCollections();
  }
}
