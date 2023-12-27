import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/error_handling/failure.dart';
import '../../../../domain/model/domain_collection.dart';
import '../../../../domain/usecase/get_category_collections_usecase.dart';
import '../../../model/ui_collection.dart';

part 'category_collections_state.dart';

class CategoryCollectionsCubit extends Cubit<CategoryCollectionsState> {
  final GetCategoryCollectionsUseCase useCase;

  late Function(List<DomainCollection>) successHandler;
  late Function(Failure) errorHandler;
  CategoryCollectionsCubit(this.useCase)
      : super(CategoryCollectionsInitialState()) {
    initCategoriesStateHandlers();
  }

  void initCategoriesStateHandlers() {
    errorHandler = (error) {
      emit(CategoryCollectionsErrorState(error.message));
    };

    successHandler = (domainCollections) {
      emit(CategoryCollectionsSuccessState(domainCollections
          .map((domainCollection) => UiCollection.fromDomain(domainCollection))
          .toList()));
    };
  }

  void getCategoryCollections(String categoryId) {
    emit(CategoryCollectionsLoadingState());
    useCase
        .execute(categoryId)
        .then((response) => response.fold(errorHandler, successHandler));
  }
}
