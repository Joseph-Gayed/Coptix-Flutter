import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/model/domain_collection.dart';
import 'package:coptix/domain/repository/content_repository.dart';
import 'package:coptix/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetCollectionsUseCase
    extends UseCaseWithoutInput<List<DomainCollection>> {
  final ContentRepository repository;

  GetCollectionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DomainCollection>>> execute() {
    return repository.getHomeCollections();
  }
}