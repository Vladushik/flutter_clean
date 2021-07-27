import 'package:hive/hive.dart';

part 'author.g.dart';

@HiveType(typeId: 1)
class Author {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String type;

  Author({required this.name, required this.type});
}
