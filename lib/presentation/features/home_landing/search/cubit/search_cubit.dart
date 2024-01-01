import 'package:coptix/domain/model/domain_paginated_clips.dart';
import 'package:dartz/dartz.dart';
import 'package:debounce_throttle/debounce_throttle.dart';

import '../../../../../core/network/error_handling/failure.dart';
import '../../../../../domain/model/search_request_params.dart';
import '../../../../../domain/usecase/search_usecase.dart';
import '../../../../../shared/cubit/paginated_content_cubit.dart';
import '../../../../../shared/utils/constants.dart';

class SearchCubit extends PaginatedContentCubit {
  late final Debouncer<Tuple2<String, bool>> debouncer;
  SearchCubit(SearchUseCase super.useCase) {
    initDebouncer();
  }

  void initDebouncer() {
    debouncer = Debouncer<Tuple2<String, bool>>(
        const Duration(seconds: searchThrottleMinSeconds),
        initialValue: const Tuple2("", true));

    debouncer.values.listen((searchPair) {
      String keyword = searchPair.value1;
      bool isFirstPage = searchPair.value2;
      if (keyword.length >= searchDebounceMinChars) {
        _search(keyword, isFirstPage: isFirstPage);
      }
    });
  }

  void search(String keyWord, {bool isFirstPage = true}) {
    debouncer.value = Tuple2(keyWord, isFirstPage);
  }

  void _search(String keyWord, {bool isFirstPage = true}) {
    if (isFirstPage) {
      SearchRequest request = SearchRequest(keyword: keyWord);
      fetchFirstPage(request, (_) => _executeSearchUseCase(request));
    } else {
      SearchRequest request =
          SearchRequest(keyword: keyWord, page: getNumberOfNextPage());

      fetchNextPage(
        request,
        (_) => _executeSearchUseCase(request),
      );
    }
  }

  Future<Either<Failure, DomainPaginatedClips>> _executeSearchUseCase(
      SearchRequest request) async {
    return useCase.execute(request);
  }

  @override
  void loadMore() {
    String keyword = debouncer.value.value1;
    _search(keyword, isFirstPage: false);
  }
}
