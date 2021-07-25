import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/exceptions.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/network/network_info.dart';
import 'package:flutter_clean/features/author/data/datasources/similar_local_data_source.dart';
import 'package:flutter_clean/features/author/data/datasources/similar_remote_data_source.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:flutter_clean/features/author/domain/repositories/similar_repository.dart';

typedef Future<Datum> _getDataChooser();

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
        final remoteSimilar = await remoteDataSource.getSimilar(name);
        localDataSource.cacheDatum(remoteSimilar);
        return Right(remoteSimilar);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSimilar = await localDataSource.getLastDatum();
        return Right(localSimilar);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
