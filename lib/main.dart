import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readlog/base.dart';
import 'package:readlog/words_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => WordsProvider(),
      child: MaterialApp(
        home: Base(),
      ),
    );
  }
}
