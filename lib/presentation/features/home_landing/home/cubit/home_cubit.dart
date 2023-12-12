import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/usecase/home_usecase.dart';
import 'package:coptix/presentation/model/ui_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/model/domain_home.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;

  late Function(DomainHome) successHandler;
  late Function(Failure) errorHandler;

  HomeState _homeState = HomeInitialState();
  HomeState get homeState => _homeState;

  HomeCubit(this.homeUseCase) : super(HomeInitialState()) {
    initCategoriesStateHandlers();
  }

  void initCategoriesStateHandlers() {
    errorHandler = (error) {
      emit(HomeErrorState(error.message));
    };

    successHandler = (domainHome) {
      emit(HomeSuccessState(UiHome.fromDomain(domainHome)));
    };
  }

  getHome() {
    emit(HomeLoadingState());
    homeUseCase.execute().then((response) {
      return response.fold(errorHandler, successHandler);
    });
  }

  @override
  void emit(HomeState state) {
    _homeState = state;
    super.emit(state);
  }
}
