import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/meaning_data.dart';

final bookListProvider = StateProvider((_) => {
  'Elementary Linear Algebra': {
    'author': 'Andrilli & Hecker',
    'words': ['Word 1', 'Word 2', 'Word 3', 'Word 4']
  },
  'Practical Malware Analysis': {
    'author': 'Michael Sikorski',
    'words': ['Word 4', 'Word 5', 'Word 6', 'test']
  },
  'Foundation and Earth': {
    'author': 'Isaac Asimov',
    'words': ['Sibilant', 'Virility', 'Alacrity', 'Inveigled', 'Apocryphal']
  },
});

final currentMeaningProvider = StateProvider((_) => MeaningData(meanings: [{'m1':'m2'}], phonetics: [{'p1':'p2'}]));

final mainNavIndexProvider = StateProvider((_) => 0);
final bookNavIndexProvider = StateProvider((_) => 0);
