import 'package:flutter/material.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';

class SimilarDisplay extends StatelessWidget {
  final Datum datum;

  const SimilarDisplay({
    Key? key,
    required this.datum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: ListView.builder(
          itemCount: datum.similar.results.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(datum.similar.results[index].name),
              subtitle: Text(datum.similar.results[index].type),
            );
          }),
    );
  }
}

/*ListView.builder(
                  itemCount: artist.similar.results.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(artist.similar.results[index].name),
                      subtitle: Text(artist.similar.results[index].type),
                    );
                  }),*/
