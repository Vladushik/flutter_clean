import 'package:flutter/material.dart';
import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/database/author_database.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'author_card_widget.dart';

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
    //  AuthorsDatabase.instance.close();
    super.dispose();
  }

  Future refreshAuthors() async {
    setState(() => isLoading = true);
    this.authors = await AuthorsDatabase.instance.readAllAuthors();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : authors.isEmpty
                  ? Text('No data')
                  : buildAuthors(),
        ),
      );

  Widget buildAuthors() => ListView.builder(
        itemCount: authors.length,
        itemBuilder: (context, index) {
          final author = authors[index];

          return AuthorCardWidget(author: author, index: index);
        },
      );
}
