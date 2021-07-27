import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_clean/features/author/data/database/author.dart';

abstract class HistoryState extends Equatable {
  @override
  List<Object> get props => [];
}

// initial
class AuthorInitial extends HistoryState {}

// loading
class AuthorsLoading extends HistoryState {}

//  your notes
class YourAuthorsState extends HistoryState {
  final List<Author> authors; // get all notes

  YourAuthorsState({required this.authors});
}

// new note
class NewAuthorState extends HistoryState {}
