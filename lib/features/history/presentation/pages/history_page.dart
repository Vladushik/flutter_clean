import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_clean/features/history/data/repositories/history_repository_impl.dart';
import 'package:flutter_clean/features/history/domain/usecases/read_all_authors.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_clean/features/history/presentation/widgets/history.dart';

import '../../../../injection_container.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (_) => hstr<HistoryBloc>(),
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
