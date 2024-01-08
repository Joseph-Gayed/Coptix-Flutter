import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/model/auth_request_params.dart';
import 'package:coptix/domain/repository/repository.dart';
import 'package:coptix/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../model/domain_user.dart';

class LoginUseCase extends UseCaseWithInput<AuthRequest, DomainUser> {
  final Repository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, DomainUser>> execute(AuthRequest input) {
    return repository.login(input);
  }
}
