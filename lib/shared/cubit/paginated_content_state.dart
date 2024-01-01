import '../../presentation/model/ui_paginated_clips.dart';

abstract class PaginatedContentState {
  @override
  String toString() {
    if (this is PaginatedContentLoadingState) {
      return "PaginatedContentLoadingState";
    } else if (this is PaginatedContentErrorState) {
      return "PaginatedContentErrorState";
    } else if (this is PaginatedContentSuccessState) {
      return "PaginatedContentSuccessState";
    } else if (this is PaginatedContentPaginationLoadingState) {
      return "PaginatedContentPaginationLoadingState";
    } else if (this is PaginatedContentPaginationErrorState) {
      return "PaginatedContentPaginationErrorState";
    } else if (this is PaginatedContentPaginationSuccessState) {
      return "PaginatedContentPaginationSuccessState";
    } else {
      return "PaginatedContentInitialState";
    }
  }
}

class PaginatedContentInitialState extends PaginatedContentState {}

class PaginatedContentLoadingState extends PaginatedContentState {}

class PaginatedContentErrorState extends PaginatedContentState {
  final String message;
  PaginatedContentErrorState(this.message);
}

class PaginatedContentSuccessState extends PaginatedContentState {
  final UiPaginatedClips uiPaginatedContent;
  PaginatedContentSuccessState(this.uiPaginatedContent);
}

//Pagination========
class PaginatedContentPaginationLoadingState extends PaginatedContentState {
  final UiPaginatedClips uiPaginatedContent;
  PaginatedContentPaginationLoadingState(this.uiPaginatedContent);
}

class PaginatedContentPaginationSuccessState extends PaginatedContentState {
  final UiPaginatedClips uiPaginatedContent;
  PaginatedContentPaginationSuccessState(this.uiPaginatedContent);
}

class PaginatedContentPaginationErrorState extends PaginatedContentState {
  final String message;
  final UiPaginatedClips uiPaginatedContent;
  PaginatedContentPaginationErrorState(this.message, this.uiPaginatedContent);
}
