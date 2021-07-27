import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/features/author/data/database/author_database.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_event.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_state.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<HistoryBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(AuthorDatabase()),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
                  if (state is YourAuthorsState) {
                    return NoteGrid(state: state);
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteGrid extends StatelessWidget {
  final YourAuthorsState state;
  NoteGrid({required this.state});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: state.authors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final note = state.authors[index];
          return InkWell(
            child: NoteCard(
              name: note.name,
              type: note.type,
            ),
          );
        });
  }
}

class NoteCard extends StatelessWidget {
  final String name;
  final String type;

  const NoteCard({required this.name, required this.type});

  @override
  Widget build(BuildContext context) {
    final Color black = Color(0xFFfdffb6);
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
          child: Column(
            children: [
              Text(
                '$name',
                style: TextStyle(
                    color: black,
                    letterSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: .5,
                width: double.infinity,
                color: black,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(
                  '$type',
                  style: TextStyle(
                      color: black,
                      fontSize: 14,
                      wordSpacing: 1.25,
                      letterSpacing: 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
