import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/features/history/data/repositories/history_repository_impl.dart';
import 'package:flutter_clean/features/history/presentation/bloc/cubit/history_cubit.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepositoryImpl historyRepositoryImpl = HistoryRepositoryImpl();

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    final List<Author> _loadedAuthorsList =
        await historyRepositoryImpl.readAllAuthors();
    yield HistoryLoadedState(loadedAuthor: _loadedAuthorsList);
  }
}
