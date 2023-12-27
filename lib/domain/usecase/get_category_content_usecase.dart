import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/model/category_content_request_params.dart';
import 'package:coptix/domain/model/domain_category_content.dart';
import 'package:coptix/domain/repository/content_repository.dart';
import 'package:coptix/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetCategoryContentUseCase
    extends UseCaseWithInput<CategoryContentRequest, DomainCategoryContent> {
  final ContentRepository repository;

  GetCategoryContentUseCase(this.repository);

  @override
  Future<Either<Failure, DomainCategoryContent>> execute(
      CategoryContentRequest input) {
    return repository.getCategoryContent(input);
  }
}