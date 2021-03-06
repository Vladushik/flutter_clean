import 'package:flutter/material.dart';

import 'package:flutter_clean/core/database/author.dart';
import 'package:flutter_clean/core/database/author_database.dart';

import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';

class SimilarDisplay extends StatelessWidget {
  final Datum datum;

  const SimilarDisplay({
    Key? key,
    required this.datum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          child: ListView.builder(
            itemCount: datum.similar.results.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(datum.similar.results[index].name),
                subtitle: Text(datum.similar.results[index].type),
              );
            },
          ),
        ),
      ],
    );
  }




}
