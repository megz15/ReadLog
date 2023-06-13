import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/screens.dart';

final bookListProvider = StateProvider((_) => <List<String>>[
  ['Elementary Linear Algebra', 'Andrilli, Hecker'],
  ['Practical Malware Analysis', 'Michael Sikorski'],
  ['Foundation and Earth', 'Isaac Asimov']]
);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReadLog',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Home(),
    );
  }
}