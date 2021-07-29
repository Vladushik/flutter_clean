import 'package:flutter/material.dart';

import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/database/author_database.dart';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late List<Author> authors;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    refreshAuthors();
  }

  @override
  void dispose() {
    //  historyBloc.dispose();
    super.dispose();
  }

  Future refreshAuthors() async {
    setState(() => isLoading = true);
    this.authors = await AuthorsDatabase.instance.readAllAuthors();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: Center(
        child: ListView.builder(
            itemCount: authors.length,
            itemBuilder: (BuildContext context, int index) {
              final author = authors[index];
              return Card(
                color: Colors.grey[200],
                child: Container(
                  constraints: BoxConstraints(minHeight: 70),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(author.name),
                      SizedBox(height: 5),
                      Text(author.type),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}