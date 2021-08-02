import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/database/author_database.dart';
import 'package:flutter_clean/core/datasources/similar_local_data_source.dart';
import 'package:flutter_clean/features/history/domain/repositories/history_repository.dart';
import 'package:sqflite/sqflite.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final SimilarLocalDataSource localDataSource;

  HistoryRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Author>> readAllAuthors() {
    return localDataSource.readAllAuthors();
  }

/*
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
  */

}
