import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/model/domain_category.dart';
import 'package:coptix/domain/model/domain_collection.dart';
import 'package:coptix/domain/model/domain_home.dart';
import 'package:coptix/domain/usecase/base_usecase.dart';
import 'package:coptix/domain/usecase/get_categories_usecase.dart';
import 'package:coptix/domain/usecase/get_collections_usecase.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase extends UseCaseWithoutInput<DomainHome> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetCollectionsUseCase getCollectionsUseCase;

  HomeUseCase(this.getCategoriesUseCase, this.getCollectionsUseCase);

  @override
  Future<Either<Failure, DomainHome>> execute() async {
    Either<Failure, List<DomainCategory>> categoriesResponse =
        await getCategoriesUseCase.execute();
    Either<Failure, List<DomainCollection>> collectionsResponse =
        await getCollectionsUseCase.execute();

    //if collections response is failure  , no need for the categories ,
    // just return the failure of the collections
    if (collectionsResponse.isLeft()) {
      return collectionsResponse
          .map((collectionsFailure) => const DomainHome());
    } else {
      return _handleSuccess(categoriesResponse, collectionsResponse);
    }
  }

  Right<Failure, DomainHome> _handleSuccess(
      Either<Failure, List<DomainCategory>> categoriesResponse,
      Either<Failure, List<DomainCollection>> collectionsResponse) {
    //if the categories is success add it's content to the domainHome.categories otherwise add empty list
    List<DomainCategory> categoriesList = [];
    if (categoriesResponse.isRight()) {
      categoriesList = categoriesResponse.getOrElse(() => []);
    }

    //add the list of collections in the domainHome.collections
    List<DomainCollection> collectionsList =
        collectionsResponse.getOrElse(() => []);

    return Right(DomainHome(
      categories: categoriesList,
      collections: collectionsList,
    ));
  }
}
