import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/database/author_database.dart';
import 'package:flutter_clean/core/error/exceptions.dart';
import 'package:flutter_clean/features/author/data/models/similar_model.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
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
  Future<void> cacheDatum(Datum datum) async {
    final db = await AuthorsDatabase.instance.database;
    db.delete('authors');

    for (var item in datum.similar.results) {
      var author = Author(name: item.name, type: item.type);
      await AuthorsDatabase.instance.create(author);
    }
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
