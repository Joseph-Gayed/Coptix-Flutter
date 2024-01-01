import 'package:coptix/domain/model/category_content_request_params.dart';
import 'package:coptix/domain/usecase/get_category_content_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/error_handling/failure.dart';
import '../../../../domain/model/domain_paginated_clips.dart';
import '../../../../shared/cubit/paginated_content_cubit.dart';

class CategoryContentCubit extends PaginatedContentCubit {
  CategoryContentCubit(GetCategoryContentUseCase super.useCase);

  String _categoryId = "";

  void getCategoryContent(String categoryId, {bool isFirstPage = false}) {
    _categoryId = categoryId;
    if (isFirstPage) {
      CategoryContentRequest request = CategoryContentRequest(id: categoryId);
      fetchFirstPage(
          request, (_) => _executeGetCategoryContentUsecase(request));
    } else {
      CategoryContentRequest request =
          CategoryContentRequest(id: categoryId, page: getNumberOfNextPage());

      fetchNextPage(
        request,
        (_) => _executeGetCategoryContentUsecase(request),
      );
    }
  }

  Future<Either<Failure, DomainPaginatedClips>>
      _executeGetCategoryContentUsecase(CategoryContentRequest request) async {
    return useCase.execute(request);
  }

  @override
  void loadMore() {
    getCategoryContent(_categoryId);
  }
}
