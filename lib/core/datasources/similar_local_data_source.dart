import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/database/author_database.dart';

import 'package:flutter_clean/features/author/data/models/similar_model.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';

import 'package:sqflite/sqflite.dart';

abstract class SimilarLocalDataSource {
  Future<void> saveToDatabase(DatumModel datumModel);
  Future<List<Author>> readAllAuthors();
}

class SimilarLocalDataSourceImpl implements SimilarLocalDataSource {
  @override
  Future<void> saveToDatabase(Datum datum) async {
    _clearDatabase();
    for (var item in datum.similar.results) {
      var author = Author(name: item.name, type: item.type);
      await _insertAuthorToDatabase(author);
    }
  }

  Future<Author> _insertAuthorToDatabase(Author author) async {
    final Database db = await AuthorsDatabase.instance.database;
    final int id = await db.insert(tableAuthors, author.toJson());
    return author.copy(id: id);
  }

  void _clearDatabase() async {
    final db = await AuthorsDatabase.instance.database;
    db.delete('authors');
  }

  Future<List<Author>> readAllAuthors() async {
    print('show data');
    final Database db = await AuthorsDatabase.instance.database;
    final String orderBy = '${AuthorFields.id} ASC';
    final List<Map<String, Object?>> result =
        await db.query(tableAuthors, orderBy: orderBy);
    return result.map((json) => Author.fromJson(json)).toList();
  }
}

// реализация метода отображения
