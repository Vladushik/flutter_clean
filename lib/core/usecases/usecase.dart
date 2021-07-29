import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class HistoryUseCase<Author> {


  Future<List<Author>> readAllAuthors();


}