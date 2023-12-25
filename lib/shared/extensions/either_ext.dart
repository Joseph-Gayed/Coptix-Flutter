import 'package:dartz/dartz.dart';

extension EitherExt<L, R> on Either<L, R> {
  R? getOrNull() {
    return fold(
      (left) => null, // Return null for left (failure) value
      (right) => right, // Return the right (success) value
    );
  }
}
