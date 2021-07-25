import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  Datum({
    required this.similar,
  });

  final Similar similar;

  @override
  List<Object?> get props => [similar];
}

class Similar extends Equatable {
  Similar({
    required this.info,
    required this.results,
  });

  final List<Info> info;
  final List<Info> results;

  @override
  List<Object?> get props => [info, results];
}

class Info extends Equatable {
  Info({
    required this.name,
    required this.type,
  });

  final String name;
  final String type;

  @override
  List<Object?> get props => [name, type];
}
