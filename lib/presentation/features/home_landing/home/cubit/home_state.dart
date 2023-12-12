import '../../../../model/ui_home.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}

class HomeSuccessState extends HomeState {
  final UiHome uiHome;
  HomeSuccessState(this.uiHome);
}
