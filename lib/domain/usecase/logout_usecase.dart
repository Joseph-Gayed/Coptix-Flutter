import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/repository/content_repository.dart';
import 'package:coptix/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';


class LogoutUseCase extends UseCaseWithoutInput<bool> {
  final ContentRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> execute() {
    return repository.logout();
  }
}
