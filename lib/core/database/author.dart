final String tableAuthors = 'authors';

class AuthorFields {
  static final List<String> values = [id, name, type];

  static final String id = '_id';
  static final String name = 'name';
  static final String type = 'type';
}

class Author {
  final int? id;
  final String name;
  final String type;

  const Author({this.id, required this.name, required this.type});

  Author copy({
    int? id,
    String? name,
    String? type,
  }) =>
      Author(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  static Author fromJson(Map<String, Object?> json) => Author(
        id: json[AuthorFields.id] as int?,
        name: json[AuthorFields.name] as String,
        type: json[AuthorFields.type] as String,
      );

  Map<String, Object?> toJson() => {
        AuthorFields.id: id,
        AuthorFields.name: name,
        AuthorFields.type: type,
      };
}
