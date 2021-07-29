import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/usecases/usecase.dart';
import 'package:flutter_clean/features/history/domain/repositories/history_repository.dart';

class ReadAllAuthors implements HistoryUseCase<Author> {
  final HistoryRepository repository;

  ReadAllAuthors(this.repository);

  @override
  Future<List<Author>> readAllAuthors() async {
    return await repository.readAllAuthors();
  }
}



