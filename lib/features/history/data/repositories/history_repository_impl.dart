import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/database/author_database.dart';
import 'package:flutter_clean/features/history/domain/repositories/history_repository.dart';
import 'package:sqflite/sqflite.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  @override
  Future<List<Author>> readAllAuthors() async {
    print('show data');
    final Database db = await AuthorsDatabase.instance.database;
    final String orderBy = '${AuthorFields.id} ASC';
    final List<Map<String, Object?>> result =
        await db.query(tableAuthors, orderBy: orderBy);
    return result.map((json) => Author.fromJson(json)).toList();
  }
}
