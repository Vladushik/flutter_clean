import 'package:equatable/equatable.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SimilarState extends Equatable {
  SimilarState([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [props];
}

class Empty extends SimilarState {}

class Loading extends SimilarState {}

class Loaded extends SimilarState {
  final Datum datum;

  Loaded({required this.datum});
  @override
  List<Object> get props => [datum];
}

class Error extends SimilarState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
