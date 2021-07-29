import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:flutter_clean/features/author/presentation/bloc/bloc.dart';

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
            hintText: 'Input a name',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            getData();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: getData,
              ),
            ),
          ],
        )
      ],
    );
  }

  void getData() async {
    controller.clear();
    BlocProvider.of<SimilarBloc>(context).add(GetSimilarData(inputStr!));
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
