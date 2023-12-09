import 'package:bloc/bloc.dart';
import 'package:coptix/core/network/api_error.dart';
import 'package:coptix/domain/model/details_request_params.dart';
import 'package:coptix/domain/model/domain_clip.dart';
import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/shared/enums/collection_display_type.dart';
import 'package:coptix/shared/enums/content_type.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../domain/repository/content_repository.dart';

part 'video_details_state.dart';

class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  final ContentRepository repository;
  late Function(ApiException) errorHandler;
  late Function(DomainClip) successHandler;

  VideoDetailsCubit(this.repository) : super(VideoDetailsInitialState()) {
    errorHandler = (error) {
      emit(VideoDetailsErrorState(error.message));
    };

    successHandler = (domainClip) {
      UiClip uiClip = UiClip.fromDomain(domainClip,
          jsonValueToCollectionDisplayType(domainClip.displayType ?? ""));
      emit(VideoDetailsSuccessState(uiClip));
    };
  }

  getClipDetails(UiClip request) {
    emit(VideoDetailsLoadingState());
    var detailsRequestParams =
        DetailsRequestParams(request.id, request.contentType.valueAsString());
    repository.getClipDetails(detailsRequestParams).then((collectionsEither) {
      return collectionsEither.fold(errorHandler, successHandler);
    });
  }
}
