import 'package:dartz/dartz.dart';
import '../../core/network/error_handling/failure.dart';

abstract class UseCaseWithInput<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

abstract class UseCaseWithoutInput<Out> {
  Future<Either<Failure, Out>> execute();
}
