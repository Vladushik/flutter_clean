import 'package:flutter/material.dart';
import 'package:flutter_clean/features/author/data/database/author.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/similar_entity.dart';

class CachePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Search'),
        color: Theme.of(context).accentColor,
        textTheme: ButtonTextTheme.primary,
        onPressed: doSome,
      ),
    );
  }

  void doSome() async {
    var box = await Hive.openBox<Author>('authors3');

    print(box.getAt(1)!.name);
    //  box.close();
  }
}
