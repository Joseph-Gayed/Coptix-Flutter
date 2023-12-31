import 'package:coptix/domain/model/category_content_request_params.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/error_handling/failure.dart';
import '../../domain/model/auth_request_params.dart';
import '../../domain/model/details_request_params.dart';
import '../../domain/model/domain_category.dart';
import '../../domain/model/domain_category_content.dart';
import '../../domain/model/domain_clip.dart';
import '../../domain/model/domain_collection.dart';
import '../../domain/model/domain_user.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, DomainUser>> login(AuthRequest request);
  Future<Either<Failure, DomainUser>> signup(AuthRequest request);
  Future<Either<Failure, bool>> forgetPassword(AuthRequest request);

  Future<Either<Failure, List<DomainCategory>>> getHomeCategories();
  Future<Either<Failure, List<DomainCollection>>> getCategoryCollections(
      String categoryId);
  Future<Either<Failure, DomainPaginatedClips>> getCategoryContent(
      CategoryContentRequest request);
  Future<Either<Failure, List<DomainCollection>>> getHomeCollections();
  Future<Either<Failure, DomainClip>> getClipOrSeriesDetails(
      DetailsRequestParams request);
}
