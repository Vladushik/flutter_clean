//
// import 'package:dartz/dartz.dart';
// import 'package:flutter_clean/core/database/author.dart';
// import 'package:flutter_clean/core/error/failures.dart';
// import 'package:flutter_clean/features/history/data/datasources/history_local_data_source.dart';
// import 'package:flutter_clean/features/history/domain/repositories/history_repository.dart';
//
// class HistoryRepositoryImpl implements HistoryRepository {
//
//   final HistoryLocalDataSource localDataSource;
//
//
//   HistoryRepositoryImpl({
//
//     required this.localDataSource
//
//   });
//
//
//   @override
//   Future<Either<Failure, Author>> clearData() {
//
//   }
//
//   @override
//   Future<Either<Failure, Author>> getData() async {
//     final remoteSimilar = await remoteDataSource.getSimilar(name);
//     localDataSource.cacheDatum(remoteSimilar);
//     return Right(remoteSimilar);
//   }
//
//   @override
//   Future<Either<Failure, Author>> loadData() {
//
//   }
// }
