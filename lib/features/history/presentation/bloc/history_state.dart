import 'package:equatable/equatable.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HistoryState extends Equatable {
  HistoryState([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [props];
}

class Empty extends HistoryState {}

class Loading extends HistoryState {}

class Loaded extends HistoryState {
  final Datum datum;

  Loaded({required this.datum});
  @override
  List<Object> get props => [datum];
}

class Error extends HistoryState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
