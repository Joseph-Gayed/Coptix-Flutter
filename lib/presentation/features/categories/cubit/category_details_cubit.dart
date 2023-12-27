import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/error_handling/failure.dart';
import '../../../../domain/model/domain_collection.dart';
import '../../../../domain/usecase/get_category_details_usecase.dart';
import '../../../model/ui_collection.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  final GetCategoryDetailsUseCase useCase;

  late Function(List<DomainCollection>) successHandler;
  late Function(Failure) errorHandler;
  CategoryDetailsCubit(this.useCase) : super(CategoryDetailsInitialState()) {
    initCategoriesStateHandlers();
  }

  void initCategoriesStateHandlers() {
    errorHandler = (error) {
      emit(CategoryDetailsErrorState(error.message));
    };

    successHandler = (domainCollections) {
      emit(CategoryDetailsSuccessState(domainCollections
          .map((domainCollection) => UiCollection.fromDomain(domainCollection))
          .toList()));
    };
  }

  void getCategoryDetails(String categoryId) {
    emit(CategoryDetailsLoadingState());
    useCase
        .execute(categoryId)
        .then((response) => response.fold(errorHandler, successHandler));
  }
}
