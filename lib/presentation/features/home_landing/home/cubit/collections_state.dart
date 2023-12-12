import '../../../../model/ui_collection.dart';

abstract class HomeCollectionsState {}

class CollectionsInitialState extends HomeCollectionsState {}

class CollectionsLoadingState extends HomeCollectionsState {}

class CollectionsErrorState extends HomeCollectionsState {
  final String message;
  CollectionsErrorState(this.message);
}

class CollectionsSuccessState extends HomeCollectionsState {
  final List<UiCollection> collections;
  CollectionsSuccessState(this.collections);
}
