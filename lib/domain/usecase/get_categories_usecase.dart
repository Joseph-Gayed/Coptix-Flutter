import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/model/domain_category.dart';
import 'package:coptix/domain/repository/repository.dart';
import 'package:coptix/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesUseCase extends UseCaseWithoutInput<List<DomainCategory>> {
  final Repository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<DomainCategory>>> execute() {
    return repository.getHomeCategories();
  }
}
