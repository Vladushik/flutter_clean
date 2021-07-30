import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_event.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HistoryBloc historyBloc = BlocProvider.of<HistoryBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            historyBloc.add(HistoryReadAllAuthorsEvent());
          },
          color: Colors.green,
        ),
      ],
    );
  }
}
