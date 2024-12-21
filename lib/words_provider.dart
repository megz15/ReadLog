import 'dart:collection';

import 'package:flutter/material.dart';

class WordsProvider extends ChangeNotifier {
  final List<String> _words = ['flutter', 'dart'];

  UnmodifiableListView<String> get words => UnmodifiableListView(_words);

  void addWord(String word) {
    _words.add(word);
    notifyListeners();
  }

  void removeWord(String word) {
    _words.remove(word);
    notifyListeners();
  }
}
