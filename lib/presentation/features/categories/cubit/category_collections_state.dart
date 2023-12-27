part of 'category_collections_cubit.dart';

abstract class CategoryCollectionsState {}

class CategoryCollectionsInitialState extends CategoryCollectionsState {}

class CategoryCollectionsLoadingState extends CategoryCollectionsState {}

class CategoryCollectionsErrorState extends CategoryCollectionsState {
  final String message;
  CategoryCollectionsErrorState(this.message);
}

class CategoryCollectionsSuccessState extends CategoryCollectionsState {
  final List<UiCollection> collections;
  CategoryCollectionsSuccessState(this.collections);
}
