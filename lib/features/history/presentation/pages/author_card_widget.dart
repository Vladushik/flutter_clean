import 'package:flutter/material.dart';
import 'package:flutter_clean/core/database/author.dart';

class AuthorCardWidget extends StatelessWidget {
  AuthorCardWidget({
    Key? key,
    required this.author,
    required this.index,
  }) : super(key: key);

  final Author author;
  final int index;
  // AuthorCardWidget(this.type, this.name);
  //
  // final String name;
  // final String type;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
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
  }
}
