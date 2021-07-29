import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/database/author_database.dart';
import 'package:flutter_clean/core/error/exceptions.dart';
import 'package:flutter_clean/features/author/data/models/similar_model.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

abstract class SimilarLocalDataSource {
  Future<void> saveToDatabase(DatumModel datumModel);
  void clearDatabase();

}

class SimilarLocalDataSourceImpl implements SimilarLocalDataSource {

  @override
  Future<void> saveToDatabase(Datum datum) async {
    clearDatabase();
    for (var item in datum.similar.results) {
      var author = Author(name: item.name, type: item.type);
      await insertAuthorToDatabase(author);
    }
  }


  Future<Author> insertAuthorToDatabase(Author author) async {
    final Database db = await AuthorsDatabase.instance.database;
    final int id = await db.insert(tableAuthors, author.toJson());
    return author.copy(id: id);
  }


  @override
  void clearDatabase() async {
    final db = await AuthorsDatabase.instance.database;
    db.delete('authors');
  }
}
