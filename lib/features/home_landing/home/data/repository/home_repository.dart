import 'package:coptix/features/home_landing/home/data/remote/home_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/network/api_error.dart';
import '../../domain/model/domain_collection.dart';
import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ApiException, List<DomainCollection>>> getHomeCollections() {
    return remoteDataSource.getHomeCollections();
  }
}
