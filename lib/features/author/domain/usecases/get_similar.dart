import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/usecases/usecase.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:flutter_clean/features/author/domain/repositories/similar_repository.dart';

class GetSimilar implements UseCase<Datum, Params> {
  final SimilarRepository repository;

  GetSimilar(this.repository);

  @override
  Future<Either<Failure, Datum>> call(Params params) async {
    return await repository.getSimilar(params.name);
  }




}

class Params extends Equatable {
  final String name;

  Params({required this.name});

  @override
  List<Object?> get props => [name];
}
