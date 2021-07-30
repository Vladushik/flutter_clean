import 'package:flutter_clean/core/database/author.dart';

abstract class HistoryState {}

class HistoryEmptyState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryLoadedState extends HistoryState {
  List<Author> authors;
  HistoryLoadedState({required this.authors});
}

class HistoryErrorState extends HistoryState {}
