import 'package:coptix/core/network/error_handling/failure.dart';
import 'package:coptix/domain/model/auth_request_params.dart';
import 'package:coptix/domain/repository/repository.dart';
import 'package:coptix/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase extends UseCaseWithInput<AuthRequest, bool> {
  final Repository repository;

  ForgetPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> execute(AuthRequest input) {
    return repository.forgetPassword(input);
  }
}
