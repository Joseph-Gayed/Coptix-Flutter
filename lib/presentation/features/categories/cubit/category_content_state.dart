part of 'category_content_cubit.dart';

abstract class CategoryContentState {}

class CategoryContentInitialState extends CategoryContentState {}

class CategoryContentLoadingState extends CategoryContentState {}

class CategoryContentErrorState extends CategoryContentState {
  final String message;
  CategoryContentErrorState(this.message);
}

class CategoryContentSuccessState extends CategoryContentState {
  final UiCategoryContent uiCategoryContent;
  CategoryContentSuccessState(this.uiCategoryContent);
}

//Pagination========
class CategoryContentPaginationLoadingState extends CategoryContentState {}

class CategoryContentPaginationSuccessState extends CategoryContentState {
  final UiCategoryContent uiCategoryContent;
  CategoryContentPaginationSuccessState(this.uiCategoryContent);
}

class CategoryContentPaginationErrorState extends CategoryContentState {
  final String message;
  CategoryContentPaginationErrorState(this.message);
}
