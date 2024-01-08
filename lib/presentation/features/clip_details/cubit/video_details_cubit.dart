import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/model/details_request_params.dart';
import 'package:coptix/domain/model/domain_clip.dart';
import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/shared/enums/collection_display_type.dart';
import 'package:coptix/shared/enums/content_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/repository/repository.dart';

part 'video_details_state.dart';

class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  final Repository repository;
  late Function(Failure) errorHandler;
  late Function(DomainClip) successHandler;

  VideoDetailsCubit(this.repository) : super(VideoDetailsInitialState()) {
    errorHandler = (error) {
      emit(VideoDetailsErrorState(error.message));
    };

    successHandler = (domainClip) {
      UiClip uiClip = UiClip.fromDomain(
          domainClip, displayTypeFromJson(domainClip.displayType ?? ""));
      emit(VideoDetailsSuccessState(uiClip));
    };
  }

  getClipDetails(UiClip request) {
    emit(VideoDetailsLoadingState());
    var detailsRequestParams = DetailsRequestParams(
        request.id, request.contentType.mediaContentTypeToJson());

    if (detailsRequestParams.isValidRequest()) {
      repository.getClipDetails(detailsRequestParams).then((collectionsEither) {
        return collectionsEither.fold(errorHandler, successHandler);
      });
    } else {
      emit(VideoDetailsSuccessState(request));
    }
  }
}
