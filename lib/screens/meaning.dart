import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readlog/providers.dart';
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
    rootBundle.loadString('lib/api/mock.json').then((value) {
      List<dynamic> jsonData = json.decode(value);
      ref.read(currentMeaningProvider.notifier).state = jsonData
          .map((e) => MeaningData.fromJSON(e["meanings"], e["phonetics"]))
          .toList();
    });

    return Scaffold(
      appBar: AppBar(title: Text(words[wordIndex])),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: currentMeaning.length,
          itemBuilder: (ctx, i) => ExpansionTile(
                title: Text("Interpretation ${i + 1}"),
                leading: const Icon(Icons.star_rounded),
                children: [
                  // ListTile(title: Text(currentMeaning[i].meanings.toString())),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: currentMeaning[i].meanings.length,
                    itemBuilder: (ctx, j) => ListView(
                      shrinkWrap: true,
                      children: [
                        Text(currentMeaning[i].meanings[j]["partOfSpeech"]),
                        Text("Definitions:\n${currentMeaning[i].meanings[j]["definitions"].map((e)=>e["definition"]).join("\n")}"),
                        currentMeaning[i].meanings[j]["synonyms"].isNotEmpty ? Text("Synonyms: ${currentMeaning[i].meanings[j]["synonyms"].join(", ")}") : Text("no syn"),
                        currentMeaning[i].meanings[j]["antonyms"].isNotEmpty ? Text("Anyonyms: ${currentMeaning[i].meanings[j]["antonyms"].join(", ")}") : Text("no ant"),
                        const Text(""),
                      ],
                    ),
                  ),
                  ListTile(title: Text(currentMeaning[i].phonetics.toString())),
                ],
              )),
    );
  }
}
