import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/features/author/data/database/author.dart';
import 'package:flutter_clean/features/author/presentation/bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/similar_entity.dart';
import '../../domain/entities/similar_entity.dart';
import 'similar_display.dart';

class SimilarControls extends StatefulWidget {
  const SimilarControls({
    Key? key,
  }) : super(key: key);

  @override
  _SimilarControlsState createState() => _SimilarControlsState();
}

class _SimilarControlsState extends State<SimilarControls> {
  final controller = TextEditingController();
  String? inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: RaisedButton(
                child: Text('Save DB'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: () {},
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() async {
    controller.clear();
    BlocProvider.of<SimilarBloc>(context).add(GetSimilarData(inputStr!));
    FocusScope.of(context).requestFocus(FocusNode());

    var box = await Hive.openBox<Author>('authors3');
    box.deleteFromDisk();
  }

  // void doSome() async {
  //   var box = await Hive.openBox<Author>('authors3');
  //
  //   for (var item in datum.similar.results) {
  //     var author = Author()
  //       ..name = item.name
  //       ..type = item.type;
  //     await box.add(author);
  //   }
  //
  //   print(box.getAt(0));
  //   box.close();
  // }
}
