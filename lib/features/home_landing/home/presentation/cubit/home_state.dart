part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}

class HomeSuccessState extends HomeState {
  final List<UiCollection> collections;
  HomeSuccessState(this.collections);
}
