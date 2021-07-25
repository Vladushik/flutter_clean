import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SimilarEvent extends Equatable {
  SimilarEvent([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [props];
}

class GetSimilarData extends SimilarEvent {
  final String nameString;

  GetSimilarData(this.nameString) : super([nameString]);

  @override
  List<Object> get props => [nameString];
}
