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
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
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

  Future<Author> create(Author author) async {
    final db = await instance.database;
    final id = await db.insert(tableAuthors, author.toJson());
    return author.copy(id: id);
  }

  Future<Author> readAuthors(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableAuthors,
      columns: AuthorFields.values,
      where: '${AuthorFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Author.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Author>> readAllAuthors() async {
    final db = await instance.database;
    final orderBy = '${AuthorFields.id} ASC';
    final result = await db.query(tableAuthors, orderBy: orderBy);
    return result.map((json) => Author.fromJson(json)).toList();
  }

  Future<int> update(Author author) async {
    final db = await instance.database;
    return db.update(
      tableAuthors,
      author.toJson(),
      where: '${AuthorFields.id} = ?',
      whereArgs: [author.id],
    );
  }

  Future<void> deleteDB() async {
    final db = await instance.database;
    db.delete('authors');
  }

  // Future close() async {
  //   final db = await instance.database;
  //
  //   db.close();
  // }
}


// Future addAuthors() async {
//   for (var item in datum.similar.results) {
//     var author = Author(name: item.name, type: item.type);
//
//     await AuthorsDatabase.instance.create(author);
//   }
// }

