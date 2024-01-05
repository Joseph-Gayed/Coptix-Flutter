import '../../../model/ui_category.dart';

abstract class CategoriesState {}

class CategoriesInitialState extends CategoriesState {
  CategoriesInitialState();
}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesErrorState extends CategoriesState {
  final String message;
  CategoriesErrorState(this.message);
}

class CategoriesSuccessState extends CategoriesState {
  final List<UiCategory> categories;
  CategoriesSuccessState(this.categories);
}
