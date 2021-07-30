import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';

abstract class SimilarRepository {
  Future<Either<Failure, Datum>> getSimilar(String name);





}
