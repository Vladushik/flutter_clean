import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/error/failures.dart';

abstract class HistoryRepository {
  Future<Author> addData();
  Future<Author> loadData();
  Future<Author> clearData();
}
