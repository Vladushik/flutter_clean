import 'package:flutter_clean/features/author/data/database/author.dart';
import 'package:hive/hive.dart';

import 'dart:async';

class AuthorDatabase {
  String _boxName = "Author";

  // open a box
  Future<Box> authorBox() async {
    var box = await Hive.openBox<Author>(_boxName);
    return box;
  }

  // get full note
  Future<List<Author>> getFullAuthor() async {
    final box = await authorBox();
    List authors = box.values.toList();
    return authors as List<Author>;
  }

  // to add data in box
  Future<void> addToBox(Author author) async {
    final box = await authorBox();

    await box.add(author);
  }

  // delete all data from box
  Future<void> deleteAll() async {
    final box = await authorBox();
    await box.clear();
  }
}
