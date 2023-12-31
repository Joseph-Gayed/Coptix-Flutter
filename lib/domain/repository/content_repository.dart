import 'package:coptix/domain/model/domain_category.dart';
import 'package:coptix/domain/model/domain_clip.dart';
import 'package:coptix/domain/model/domain_user.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/error_handling/failure.dart';
import '../../domain/model/domain_collection.dart';
import '../model/auth_request_params.dart';
import '../model/category_content_request_params.dart';
import '../model/details_request_params.dart';
import '../model/domain_category_content.dart';

abstract class ContentRepository {
  Future<DomainUser?> loadCachedUser();

  Future<Either<Failure, DomainUser>> login(AuthRequest request);
  Future<Either<Failure, DomainUser>> signup(AuthRequest request);
  Future<Either<Failure, bool>> forgetPassword(AuthRequest request);

  Future<Either<Failure, List<DomainCategory>>> getHomeCategories();

  Future<Either<Failure, List<DomainCollection>>> getCategoryCollections(
      String categoryId);
  Future<Either<Failure, DomainPaginatedClips>> getCategoryContent(
      CategoryContentRequest request);
  Future<Either<Failure, List<DomainCollection>>> getHomeCollections();
  Future<Either<Failure, DomainClip>> getClipDetails(
      DetailsRequestParams request);
  Future<Either<Failure, DomainClip>> getSeriesDetails(
      DetailsRequestParams request);
}
