import 'package:flutter_clean/core/database/author.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AuthorsDatabase {
  static final AuthorsDatabase instance = AuthorsDatabase._init();

  static Database? _database;

  AuthorsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('authors2.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
create table $tableAuthors ( 
  ${AuthorFields.id} integer primary key autoincrement, 
  ${AuthorFields.name} text not null,
  ${AuthorFields.type} text not null)
''');
  }

  Future<List<Author>> readAllAuthors() async {
    final Database db = await instance.database;
    final String orderBy = '${AuthorFields.id} ASC';
    final List<Map<String, Object?>> result =
        await db.query(tableAuthors, orderBy: orderBy);
    return result.map((json) => Author.fromJson(json)).toList();
  }

  // Future<int> update(Author author) async {
  //   final Database db = await instance.database;
  //   return db.update(
  //     tableAuthors,
  //     author.toJson(),
  //     where: '${AuthorFields.id} = ?',
  //     whereArgs: [author.id],
  //   );
  // }

  // Future<void> deleteDB() async {
  //   final Database db = await instance.database;
  //   db.delete('authors');
  // }

  // Future close() async {
  //   final db = await instance.database;
  //   db.close();
  // }
}
