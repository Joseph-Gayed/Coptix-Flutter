import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/model/domain_category.dart';
import 'package:coptix/domain/usecase/get_categories_usecase.dart';
import 'package:coptix/presentation/features/categories/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/ui_category.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase useCase;

  late Function(List<DomainCategory>) successHandler;
  late Function(Failure) errorHandler;

  CategoriesCubit(this.useCase) : super(CategoriesInitialState()) {
    initCategoriesStateHandlers();
  }

  void initCategoriesStateHandlers() {
    errorHandler = (error) {
      emit(CategoriesErrorState(error.message));
    };

    successHandler = (domainCategories) {
      List<UiCategory> uiCategories = domainCategories
          .map((domainCategory) => UiCategory.fromDomain(domainCategory))
          .toList();

      emit(CategoriesSuccessState(uiCategories));
    };
  }

  getCategories() {
    emit(CategoriesLoadingState());
    useCase.execute().then((response) {
      return response.fold(errorHandler, successHandler);
    });
  }
}
