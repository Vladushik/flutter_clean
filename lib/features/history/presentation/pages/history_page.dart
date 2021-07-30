import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/database/author_database.dart';
import 'package:flutter_clean/features/history/data/repositories/history_repository_impl.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_event.dart';
import 'package:flutter_clean/features/history/presentation/bloc/history_state.dart';
import 'package:flutter_clean/features/history/presentation/widgets/action_buttons.dart';

class HistoryPage extends StatelessWidget {
  final repositoryImpl = HistoryRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (context) => HistoryBloc(repositoryImpl: repositoryImpl),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('History'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(child: HistoryPage2()),
          ],
        ),
      ),
    );
  }
}

class HistoryPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryEmptyState) {
          return Center(
            child: Text('No data. Press button "Load"'),
          );
        }

        if (state is HistoryLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is HistoryLoadedState) {
          return ListView.builder(
            itemCount: state.authors.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.grey[300] : Colors.grey[200],
              child: ListTile(
                title: Column(
                  children: <Widget>[
                    Text(
                      '${state.authors[index].name}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ' ${state.authors[index].type}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is HistoryErrorState) {
          return Center(
            child: Text(
              'Error',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return Container();
      },
    );
  }
}

// class HistoryPage extends StatefulWidget {
//   @override
//   _HistoryPageState createState() => _HistoryPageState();
// }
//
// class _HistoryPageState extends State<HistoryPage> {
//   late List<Author> authors;
//   bool isLoading = false;
//   @override
//   void initState() {
//     super.initState();
//
//     refreshAuthors();
//   }
//
//   @override
//   void dispose() {
//     //  historyBloc.dispose();
//     super.dispose();
//   }
//
//   Future refreshAuthors() async {
//     setState(() => isLoading = true);
//     this.authors = await AuthorsDatabase.instance.readAllAuthors();
//     setState(() => isLoading = false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('History')),
//       body: Center(
//         child: ListView.builder(
//             itemCount: authors.length,
//             itemBuilder: (BuildContext context, int index) {
//               final author = authors[index];
//               return Card(
//                 color: Colors.grey[200],
//                 child: Container(
//                   constraints: BoxConstraints(minHeight: 70),
//                   padding: EdgeInsets.all(8),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(author.name),
//                       SizedBox(height: 5),
//                       Text(author.type),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
