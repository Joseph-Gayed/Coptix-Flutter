part of 'category_details_cubit.dart';

abstract class CategoryDetailsState {}

class CategoryDetailsInitialState extends CategoryDetailsState {}

class CategoryDetailsLoadingState extends CategoryDetailsState {}

class CategoryDetailsErrorState extends CategoryDetailsState {
  final String message;
  CategoryDetailsErrorState(this.message);
}

class CategoryDetailsSuccessState extends CategoryDetailsState {
  final List<UiCollection> collections;
  CategoryDetailsSuccessState(this.collections);
}
