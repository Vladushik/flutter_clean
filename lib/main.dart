import 'package:flutter/material.dart';
import 'package:flutter_clean/features/author/data/database/author.dart';

import 'package:flutter_clean/features/author/presentation/pages/similar_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(AuthorAdapter());
  // await Hive.openBox<Author>('authors3');
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimilarPage(),
    );
  }
}
