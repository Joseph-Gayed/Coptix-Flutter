part of 'video_details_cubit.dart';

@immutable
abstract class VideoDetailsState {}

class VideoDetailsInitialState extends VideoDetailsState {}

class VideoDetailsLoadingState extends VideoDetailsState {}

class VideoDetailsErrorState extends VideoDetailsState {
  final String message;
  VideoDetailsErrorState(this.message);
}

class VideoDetailsSuccessState extends VideoDetailsState {
  final List<UiCollection> collections;
  VideoDetailsSuccessState(this.collections);
}
