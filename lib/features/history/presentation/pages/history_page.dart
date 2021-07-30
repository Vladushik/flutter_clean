import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_clean/features/history/data/repositories/history_repository_impl.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_clean/features/history/presentation/widgets/history.dart';

class HistoryPage extends StatelessWidget {
  final repositoryImpl = HistoryRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (context) => HistoryBloc(repositoryImpl: repositoryImpl),
      child: Scaffold(
        appBar: AppBar(title: Text('History')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: History()),
          ],
        ),
      ),
    );
  }
}
