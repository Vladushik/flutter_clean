import 'package:flutter/material.dart';
import 'package:flutter_clean/features/author/data/database/author.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SimilarDisplay extends StatelessWidget {
  final Datum datum;

  const SimilarDisplay({
    Key? key,
    required this.datum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text('Search'),
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
          onPressed: doSome,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          child: ListView.builder(
            itemCount: datum.similar.results.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(datum.similar.results[index].name),
                subtitle: Text(datum.similar.results[index].type),
              );
            },
          ),
        ),
      ],
    );
  }

  void doSome() async {
    var box = await Hive.openBox<Author>('authors3');

    for (var item in datum.similar.results) {
      var author = Author(type: item.type, name: item.name);
      //   ..name = item.name
      //  ..type = item.type;
      await box.add(author);
    }

    print(box.getAt(0)!.name);
    print(box.getAt(0)!.name);
    // box.close();
  }
}
