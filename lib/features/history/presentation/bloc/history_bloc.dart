import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/features/author/data/database/author.dart';
import 'package:flutter_clean/features/author/data/database/author_database.dart';

import 'history_event.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final AuthorDatabase _authorDatabase;
  List<Author> _authors = [];
  HistoryBloc(this._authorDatabase);
  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is AuthorInitialEvent) {
      yield* _mapInitialEventToState();
    }

    if (event is AuthorAddEvent) {
      yield* _mapAuthorAddEventToState(name: event.name, type: event.type);
    }
  }

  // Stream Functions
  Stream<HistoryState> _mapInitialEventToState() async* {
    yield AuthorsLoading();

    await _getAuthors();

    yield YourAuthorsState(authors: _authors);
  }

  Stream<HistoryState> _mapAuthorAddEventToState(
      {required String name, required String type}) async* {
    yield AuthorsLoading();
    await _addToAuthors(name: name, type: type);
    yield YourAuthorsState(authors: _authors);
  }

  // Helper Functions
  Future<void> _getAuthors() async {
    await _authorDatabase.getFullAuthor().then((value) {
      _authors = value;
    });
  }

  Future<void> _addToAuthors(
      {required String name, required String type}) async {
    await _authorDatabase.addToBox(Author(name: name, type: type));
    await _getAuthors();
  }

  @override
  // TODO: implement initialState
  HistoryState get initialState => throw UnimplementedError();
}
