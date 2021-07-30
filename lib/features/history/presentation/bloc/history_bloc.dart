import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/features/author/presentation/bloc/bloc.dart';
import 'package:flutter_clean/features/history/data/repositories/history_repository_impl.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_event.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepositoryImpl repositoryImpl;
  //HistoryBloc({required this.repositoryImpl}) : super(HistoryEmptyState());
  HistoryBloc({required this.repositoryImpl});

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is HistoryReadAllAuthorsEvent) {
      yield HistoryLoadingState();
      try {
        final List<Author> _loadedAuthorList =
            await repositoryImpl.readAllAuthors();
        yield HistoryLoadedState(authors: _loadedAuthorList);
      } catch (_) {
        yield HistoryErrorState();
      }
    }
  }

  @override
  HistoryState get initialState => HistoryEmptyState();
}
