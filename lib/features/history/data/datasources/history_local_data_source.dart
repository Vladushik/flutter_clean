abstract class HistoryLocalDataSource {


  Future<List<Author>> readAllAuthors() async {
    final db = await instance.database;
    final orderBy = '${AuthorFields.id} ASC';
    final result = await db.query(tableAuthors, orderBy: orderBy);
    return result.map((json) => Author.fromJson(json)).toList();
  }




}
