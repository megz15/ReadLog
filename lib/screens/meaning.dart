import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/providers.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/meaning_data.dart';

class Meaning extends ConsumerWidget {
  final String bookTitle;
  final int wordIndex;

  const Meaning({super.key, required this.bookTitle, required this.wordIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookList = ref.watch(bookListProvider);
    final currentMeaning = ref.watch(currentMeaningProvider);

    List<String> words = bookList[bookTitle]!['words'] as List<String>;
    rootBundle.loadString('lib/api/mock.json').then((value){
      List<dynamic> jsonData = json.decode(value);
      ref.read(currentMeaningProvider.notifier).state = jsonData.map((e) => MeaningData.fromJSON(e)).toList();
    });

    return Scaffold(
      appBar: AppBar(title: Text(words[wordIndex])),
      body: ListView.builder(
        itemCount: currentMeaning.length,
        itemBuilder: (ctx, i) => ExpansionTile(
          title: Text("Interpretation ${i+1}"),
          leading: const Icon(Icons.star_rounded),
          children: [
            ListTile(title: Text(currentMeaning[i].meanings.toString())),
            ListTile(title: Text(currentMeaning[i].phonetics.toString())),
          ],
        )
      ),
    );}
}