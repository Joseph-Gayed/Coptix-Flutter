import 'package:coptix/shared/cubit/paginated_content_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/error_handling/failure.dart';
import '../../core/network/pagination.dart';
import '../../domain/model/domain_paginated_clips.dart';
import '../../presentation/model/ui_paginated_clips.dart';
import '../../presentation/model/ui_clip.dart';
import '../utils/constants.dart';

abstract class PaginatedContentCubit extends Cubit<PaginatedContentState> {
  final dynamic useCase;

  late Function(DomainPaginatedClips) _successHandler;
  late Function(Failure) _errorHandler;

  late Function(DomainPaginatedClips) _paginationSuccessHandler;
  late Function(Failure) _paginationErrorHandler;

  PaginatedContentCubit(this.useCase) : super(PaginatedContentInitialState()) {
    _initStateHandlers();
  }

  void _initStateHandlers() {
    _errorHandler = (error) {
      emit(PaginatedContentErrorState(error.message));
    };

    _successHandler = (domainPaginatedContent) {
      UiPaginatedClips uiPaginatedContent =
          UiPaginatedClips.fromDomain(domainPaginatedContent);

      emit(PaginatedContentSuccessState(uiPaginatedContent));
    };

    _paginationErrorHandler = (error) {
      UiPaginatedClips? uiPaginatedContentOfCurrentState =
          _getUiPaginatedContentOfCurrentState();
      emit(PaginatedContentPaginationErrorState(
          error.message, uiPaginatedContentOfCurrentState!));
    };

    _paginationSuccessHandler = (domainPaginatedContent) {
      List<UiClip> allContent = [];

      UiPaginatedClips? uiPaginatedContentOfCurrentState =
          _getUiPaginatedContentOfCurrentState();

      if (uiPaginatedContentOfCurrentState != null) {
        allContent = uiPaginatedContentOfCurrentState.content;
      }

      UiPaginatedClips newUiPaginatedContent =
          UiPaginatedClips.fromDomain(domainPaginatedContent);

      allContent.addAll(newUiPaginatedContent.content);

      var paginationPaginatedContent =
          newUiPaginatedContent.copyWith(content: allContent);
      emit(PaginatedContentPaginationSuccessState(paginationPaginatedContent));
    };
  }

  UiPaginatedClips? _getUiPaginatedContentOfCurrentState() {
    if (state is PaginatedContentSuccessState) {
      return (state as PaginatedContentSuccessState).uiPaginatedContent;
    } else if (state is PaginatedContentPaginationLoadingState) {
      return (state as PaginatedContentPaginationLoadingState)
          .uiPaginatedContent;
    } else if (state is PaginatedContentPaginationErrorState) {
      return (state as PaginatedContentPaginationErrorState).uiPaginatedContent;
    } else if (state is PaginatedContentPaginationSuccessState) {
      return (state as PaginatedContentPaginationSuccessState)
          .uiPaginatedContent;
    }
    return null;
  }

  void fetchFirstPage(
    dynamic requestObject,
    Function(dynamic) useCaseExecute,
  ) {
    emit(PaginatedContentLoadingState());
    useCaseExecute(requestObject).then((response) {
      response.fold(_errorHandler, _successHandler);
    });
  }

  void fetchNextPage(
    dynamic requestObject,
    Function(dynamic) useCaseExecute,
  ) {
    int nextPage = getNumberOfNextPage();
    if (nextPage > 0) {
      emit(PaginatedContentPaginationLoadingState(
          _getUiPaginatedContentOfCurrentState()!));
      useCaseExecute(requestObject).then((response) {
        response.fold(_paginationErrorHandler, _paginationSuccessHandler);
      });
    }
  }

  int getNumberOfNextPage() {
    Pagination lastPagination = _getLastPagination();

    return lastPagination.lastPage >= lastPagination.currentPage + 1
        ? lastPagination.currentPage + 1
        : -1;
  }

  Pagination _getLastPagination() {
    Pagination pagination;

    UiPaginatedClips? uiPaginatedContentOfCurrentState =
        _getUiPaginatedContentOfCurrentState();

    if (uiPaginatedContentOfCurrentState != null) {
      pagination = uiPaginatedContentOfCurrentState.pagination;
    } else {
      pagination = Pagination.defaultPagination();
    }

    return pagination;
  }

  bool canLoadMore() {
    var numberOfNextPage = getNumberOfNextPage();
    var canLoadMre = numberOfNextPage > paginationDefaultFirstPage;
    return canLoadMre;
  }

  // New abstract method
  void loadMore();
}
