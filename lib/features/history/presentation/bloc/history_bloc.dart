import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/features/author/presentation/bloc/bloc.dart';
import 'package:flutter_clean/features/history/data/repositories/history_repository_impl.dart';
import 'package:flutter_clean/features/history/domain/usecases/read_all_authors.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_event.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final ReadAllAuthors readAllAuthors;

  HistoryBloc({required this.readAllAuthors}) : super(HistoryEmptyState()) {
    add(HistoryReadAllAuthorsEvent());
  }

  @override
  HistoryState get initialState => HistoryEmptyState();

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is HistoryReadAllAuthorsEvent) {
      yield HistoryLoadingState();
      try {
        final List<Author> _loadedAuthorList =
            await readAllAuthors.readAllAuthors();
        yield HistoryLoadedState(authors: _loadedAuthorList);
      } catch (_) {
        yield HistoryErrorState();
      }
    }
  }
}
