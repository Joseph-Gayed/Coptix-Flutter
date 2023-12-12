import '../../../../model/ui_category.dart';

abstract class HomeCategoriesState {}

class CategoriesInitialState extends HomeCategoriesState {
  CategoriesInitialState();
}

class CategoriesLoadingState extends HomeCategoriesState {}

class CategoriesErrorState extends HomeCategoriesState {
  final String message;
  CategoriesErrorState(this.message);
}

class CategoriesSuccessState extends HomeCategoriesState {
  final List<UiCategory> categories;
  CategoriesSuccessState(this.categories);
}
