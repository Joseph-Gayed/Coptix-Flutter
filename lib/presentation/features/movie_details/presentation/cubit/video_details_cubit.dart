import 'package:bloc/bloc.dart';
import 'package:coptix/core/network/api_error.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../domain/model/domain_collection.dart';
import '../../../../../domain/repository/home_repository.dart';
import '../../../../../presentation/model/ui_collection.dart';

part 'video_details_state.dart';

class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  final HomeRepository repository;
  late Function(ApiException) errorHandler;
  late Function(List<DomainCollection>) successHandler;

  VideoDetailsCubit(this.repository) : super(VideoDetailsInitialState()) {
    errorHandler = (error) {
      emit(VideoDetailsErrorState(error.message));
    };

    successHandler = (domainCollections) {
      List<UiCollection> uiCollections = domainCollections
          .map((domain) => UiCollection.fromDomain(domain))
          .toList();
      emit(VideoDetailsSuccessState(uiCollections));
    };
  }

  getHomeCollections() {
    emit(VideoDetailsLoadingState());
    repository.getHomeCollections().then((collectionsEither) {
      return collectionsEither.fold(errorHandler, successHandler);
    });
  }
}
