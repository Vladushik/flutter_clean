import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean/core/error/exceptions.dart';
import 'package:flutter_clean/features/author/data/models/similar_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SimilarLocalDataSource {
  /// Gets the cached [DatumModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<DatumModel> getLastDatum();

  Future<void> cacheDatum(DatumModel datumToCache);
}

const CASHED_SIMILAR = 'CACHED_SIMILAR';

class SimilarLocalDataSourceImpl implements SimilarLocalDataSource {
  final SharedPreferences sharedPreferences;

  SimilarLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheDatum(DatumModel datumToCache) {
    return sharedPreferences.setString(
        CASHED_SIMILAR, json.encode(datumToCache.toJson()));
  }

  @override
  Future<DatumModel> getLastDatum() {
    final jsonString = sharedPreferences.getString(CASHED_SIMILAR);
    if (jsonString != null) {
      return Future.value(DatumModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
