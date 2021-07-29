import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failures.dart';

class InputConverter {
  Either<Failure, String> stringToUnsignedInteger(String str) {
    try {
      return Right(str);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
