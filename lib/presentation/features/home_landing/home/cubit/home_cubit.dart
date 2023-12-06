import 'package:bloc/bloc.dart';
import 'package:coptix/core/network/api_error.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../domain/model/domain_collection.dart';
import '../../../../../../domain/repository/content_repository.dart';
import '../../../../../../presentation/model/ui_collection.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ContentRepository repository;
  late Function(ApiException) errorHandler;
  late Function(List<DomainCollection>) successHandler;

  HomeCubit(this.repository) : super(HomeInitial()) {
    errorHandler = (error) {
      emit(HomeErrorState(error.message));
    };

    successHandler = (domainCollections) {
      List<UiCollection> uiCollections = domainCollections
          .map((domain) => UiCollection.fromDomain(domain))
          .toList();
      emit(HomeSuccessState(uiCollections));
    };
  }

  getHomeCollections() {
    emit(HomeLoadingState());
    repository.getHomeCollections().then((collectionsEither) {
      return collectionsEither.fold(errorHandler, successHandler);
    });
  }
}
