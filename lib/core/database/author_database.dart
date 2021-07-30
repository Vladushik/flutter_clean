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
}
