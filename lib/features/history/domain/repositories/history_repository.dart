import 'package:flutter_clean/core/database/author.dart';

abstract class HistoryRepository {
  Future<List<Author>> readAllAuthors();
}
