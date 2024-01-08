import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/model/domain_paginated_clips.dart';
import 'package:coptix/domain/repository/repository.dart';
import 'package:coptix/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../model/search_request_params.dart';

class SearchUseCase
    extends UseCaseWithInput<SearchRequest, DomainPaginatedClips> {
  final Repository repository;

  SearchUseCase(this.repository);

  @override
  Future<Either<Failure, DomainPaginatedClips>> execute(
      SearchRequest input) async {
    if (input.page > 1) await Future.delayed(const Duration(seconds: 3));
    return repository.search(input);
  }
}
