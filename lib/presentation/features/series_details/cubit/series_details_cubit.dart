import 'package:bloc/bloc.dart';
import 'package:coptix/core/network/api_error.dart';
import 'package:coptix/domain/model/details_request_params.dart';
import 'package:coptix/domain/model/domain_clip.dart';
import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/shared/enums/collection_display_type.dart';
import 'package:coptix/shared/enums/content_type.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../domain/repository/content_repository.dart';

part 'series_details_state.dart';

class SeriesDetailsCubit extends Cubit<SeriesDetailsState> {
  final ContentRepository repository;
  late Function(ApiException) errorHandler;
  late Function(DomainClip) successHandler;

  SeriesDetailsCubit(this.repository) : super(SeriesDetailsInitialState()) {
    errorHandler = (error) {
      emit(SeriesDetailsErrorState(error.message));
    };

    successHandler = (domainClip) {
      UiClip uiClip =
          UiClip.fromDomain(domainClip, CollectionDisplayType.normal);
      emit(SeriesDetailsSuccessState(uiClip));
    };
  }

  getSeriesDetails(UiClip request) {
    emit(SeriesDetailsLoadingState());
    var detailsRequestParams =
        DetailsRequestParams(request.id, request.contentType.valueAsString());
    repository.getClipDetails(detailsRequestParams).then((collectionsEither) {
      return collectionsEither.fold(errorHandler, successHandler);
    });
  }
}
