import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/datasources/similar_local_data_source.dart';
import 'package:flutter_clean/core/datasources/similar_remote_data_source.dart';
import 'package:flutter_clean/core/error/exceptions.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/network/network_info.dart';
import 'package:flutter_clean/features/author/data/models/similar_model.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:flutter_clean/features/author/domain/repositories/similar_repository.dart';

class SimilarRepositoryImpl implements SimilarRepository {
  final SimilarRemoteDataSource remoteDataSource;
  final SimilarLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  SimilarRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Datum>> getSimilar(String name) async {
    if (await networkInfo.isConnected) {
      try {
        final DatumModel remoteSimilar =
            await remoteDataSource.getSimilar(name);
        localDataSource.saveToDatabase(remoteSimilar);
        return Right(remoteSimilar);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {

      return Left(CacheFailure());

    }
  }

  //add to db
}
