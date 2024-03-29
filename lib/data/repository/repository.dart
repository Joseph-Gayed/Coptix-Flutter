import 'package:coptix/domain/model/details_request_params.dart';
import 'package:coptix/domain/model/domain_category.dart';
import 'package:coptix/domain/model/domain_clip.dart';
import 'package:coptix/domain/model/search_request_params.dart';
import 'package:coptix/shared/extensions/either_ext.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/error_handling/failure.dart';
import '../../domain/model/auth_request_params.dart';
import '../../domain/model/category_content_request_params.dart';
import '../../domain/model/domain_paginated_clips.dart';
import '../../domain/model/domain_collection.dart';
import '../../domain/model/domain_user.dart';
import '../../domain/repository/repository.dart';
import '../local/local_data_source.dart';
import '../remote/remote_data_source.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<DomainUser?> loadCachedUser() {
    return localDataSource.loadUser();
  }

  @override
  Future<Either<Failure, DomainUser>> login(AuthRequest request) async {
    Future<Either<Failure, DomainUser>> loginResponseFuture =
        remoteDataSource.login(request);
    await cacheUserIfSuccess(loginResponseFuture);
    return loginResponseFuture;
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    //TODO: to use the logout api , you must add the token in the headers.

/*    Future<Either<Failure, bool>> logoutRemoteResponseFuture =
        remoteDataSource.logout();
    bool isSuccessRemote = (await logoutRemoteResponseFuture).isRight();
    if (isSuccessRemote) {
      await localDataSource.logout();
    }*/

    return right(await localDataSource.logout());
  }

  @override
  Future<Either<Failure, DomainUser>> signup(AuthRequest request) async {
    var signupResponseFuture = remoteDataSource.signup(request);
    await cacheUserIfSuccess(signupResponseFuture);
    return signupResponseFuture;
  }

  Future<void> cacheUserIfSuccess(
      Future<Either<Failure, DomainUser>> loginResponseFuture) async {
    Either<Failure, DomainUser> loginResponseEither = await loginResponseFuture;
    DomainUser? user = loginResponseEither.getOrNull();
    if (user != null) {
      localDataSource.saveUser(user);
    }
  }

  @override
  Future<Either<Failure, bool>> forgetPassword(AuthRequest request) {
    return remoteDataSource.forgetPassword(request);
  }

  @override
  Future<Either<Failure, List<DomainCategory>>> getHomeCategories() {
    return remoteDataSource.getHomeCategories();
  }

  @override
  Future<Either<Failure, List<DomainCollection>>> getCategoryCollections(
      String categoryId) {
    return remoteDataSource.getCategoryCollections(categoryId);
  }

  @override
  Future<Either<Failure, DomainPaginatedClips>> getCategoryContent(
      CategoryContentRequest request) {
    return remoteDataSource.getCategoryContent(request);
  }

  @override
  Future<Either<Failure, List<DomainCollection>>> getHomeCollections() {
    return remoteDataSource.getHomeCollections();
  }

  @override
  Future<Either<Failure, DomainClip>> getClipDetails(
      DetailsRequestParams request) {
    return remoteDataSource.getClipOrSeriesDetails(request);
  }

  @override
  Future<Either<Failure, DomainClip>> getSeriesDetails(
      DetailsRequestParams request) {
    return remoteDataSource.getClipOrSeriesDetails(request);
  }

  @override
  Future<Either<Failure, DomainPaginatedClips>> search(SearchRequest request) {
    return remoteDataSource.search(request);
  }
}
