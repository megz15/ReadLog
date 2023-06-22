import 'package:flutter/material.dart';

class Meaning extends StatelessWidget {
  final String word;

  const Meaning({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(word)),
      body: Text(word),
    );}
}