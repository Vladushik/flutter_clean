import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_clean/core/datasources/similar_local_data_source.dart';
import 'package:flutter_clean/core/datasources/similar_remote_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/network/network_info.dart';
import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';

import 'features/author/data/repositories/similar_repository_impl.dart';
import 'features/author/domain/repositories/similar_repository.dart';
import 'features/author/domain/usecases/get_similar.dart';
import 'features/author/domain/usecases/get_similar.dart';
import 'features/author/presentation/bloc/bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => SimilarBloc(
      concrete: sl(),
      inputConverter: sl(),
    ),
  );
  // Use case
  sl.registerLazySingleton(() => GetSimilar(sl()));

  // Repo
  sl.registerLazySingleton<SimilarRepository>(
    () => SimilarRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<SimilarRemoteDataSource>(
    () => SimilarRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<SimilarLocalDataSource>(
    //  () => SimilarLocalDataSourceImpl(sharedPreferences: sl()),
    () => SimilarLocalDataSourceImpl(),
  );

  // Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
