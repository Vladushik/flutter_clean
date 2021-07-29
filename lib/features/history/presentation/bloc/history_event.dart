import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HistoryEvent extends Equatable {
  HistoryEvent([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [props];
}

class GetSimilarData extends HistoryEvent {
  final String nameString;

  GetSimilarData(this.nameString) : super([nameString]);

  @override
  List<Object> get props => [nameString];
}
