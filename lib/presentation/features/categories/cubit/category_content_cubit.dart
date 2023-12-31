import 'package:coptix/core/network/pagination.dart';
import 'package:coptix/domain/model/category_content_request_params.dart';
import 'package:coptix/domain/model/domain_category_content.dart';
import 'package:coptix/domain/usecase/get_category_content_usecase.dart';
import 'package:coptix/presentation/model/ui_category_content.dart';
import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/shared/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/error_handling/failure.dart';

part 'category_content_state.dart';

class CategoryContentCubit extends Cubit<CategoryContentState> {
  final GetCategoryContentUseCase useCase;

  late Function(DomainPaginatedClips) _successHandler;
  late Function(Failure) _errorHandler;

  late Function(DomainPaginatedClips) _paginationSuccessHandler;
  late Function(Failure) _paginationErrorHandler;

  CategoryContentCubit(this.useCase) : super(CategoryContentInitialState()) {
    _initCategoriesStateHandlers();
  }

  void _initCategoriesStateHandlers() {
    _errorHandler = (error) {
      emit(CategoryContentErrorState(error.message));
    };

    _successHandler = (domainCategoryContent) {
      UiCategoryContent uiCategoryContent =
          UiCategoryContent.fromDomain(domainCategoryContent);

      emit(CategoryContentSuccessState(uiCategoryContent));
    };

    _paginationErrorHandler = (error) {
      emit(CategoryContentPaginationErrorState(error.message));
    };

    _paginationSuccessHandler = (domainCategoryContent) {
      List<UiClip> allContent = [];

      UiCategoryContent? uiCategoryContentOfCurrentState =
          _getUiCategoryContentOfCurrentState();

      if (uiCategoryContentOfCurrentState != null) {
        allContent = uiCategoryContentOfCurrentState.content;
      }

      UiCategoryContent newUiCategoryContent =
          UiCategoryContent.fromDomain(domainCategoryContent);

      allContent.addAll(newUiCategoryContent.content);

      var paginationCategoryContent =
          newUiCategoryContent.copyWith(content: allContent);
      emit(CategoryContentPaginationSuccessState(paginationCategoryContent));
    };
  }

  UiCategoryContent? _getUiCategoryContentOfCurrentState() {
    if (state is CategoryContentSuccessState) {
      return (state as CategoryContentSuccessState).uiCategoryContent;
    } else if (state is CategoryContentPaginationSuccessState) {
      return (state as CategoryContentPaginationSuccessState).uiCategoryContent;
    } else if (state is CategoryContentPaginationLoadingState) {
      return (state as CategoryContentPaginationLoadingState).uiCategoryContent;
    }
    return null;
  }

  void getCategoryContent(String categoryId, {bool isFirstPage = false}) {
    if (isFirstPage) {
      emit(CategoryContentLoadingState());
      useCase
          .execute(CategoryContentRequest(id: categoryId))
          .then((response) => response.fold(_errorHandler, _successHandler));
    } else {
      int nextPage = _getNextPage();
      if (nextPage > 0) {
        emit(CategoryContentPaginationLoadingState(
            _getUiCategoryContentOfCurrentState()!));
        useCase
            .execute(CategoryContentRequest(id: categoryId, page: nextPage))
            .then((response) => response.fold(
                _paginationErrorHandler, _paginationSuccessHandler));
      }
    }
  }

  int _getNextPage() {
    Pagination lastPagination = _getLastPagination();

    return lastPagination.lastPage > lastPagination.currentPage + 1
        ? lastPagination.currentPage + 1
        : -1;
  }

  Pagination _getLastPagination() {
    Pagination pagination;

    UiCategoryContent? uiCategoryContentOfCurrentState =
        _getUiCategoryContentOfCurrentState();

    if (uiCategoryContentOfCurrentState != null) {
      pagination = uiCategoryContentOfCurrentState.pagination;
    } else {
      pagination = Pagination.defaultPagination();
    }

    return pagination;
  }

  canLoadMore() {
    return _getNextPage() > paginationDefaultFirstPage;
  }
}
