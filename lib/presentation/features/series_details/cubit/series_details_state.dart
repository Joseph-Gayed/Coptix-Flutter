part of 'series_details_cubit.dart';

@immutable
abstract class SeriesDetailsState {}

class SeriesDetailsInitialState extends SeriesDetailsState {}

class SeriesDetailsLoadingState extends SeriesDetailsState {}

class SeriesDetailsErrorState extends SeriesDetailsState {
  final String message;
  SeriesDetailsErrorState(this.message);
}

class SeriesDetailsSuccessState extends SeriesDetailsState {
  final UiClip uiClip;
  SeriesDetailsSuccessState(this.uiClip);
}
