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
      // ref.read(currentMeaningProvider.notifier).state = MeaningData.fromJSON(json.decode(value)[0]);
      ref.read(currentMeaningProvider.notifier).state = MeaningData.fromJSON(json.decode(value)[0]);
    });

    return Scaffold(
      appBar: AppBar(title: Text(words[wordIndex])),
      body: Text(currentMeaning.meanings.toString()),
    );}
}