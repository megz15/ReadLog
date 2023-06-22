import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookListProvider = StateProvider((_) => {
  'Elementary Linear Algebra': {
    'author': 'Andrilli & Hecker',
    'words': ['Word 1', 'Word 2', 'Word 3', 'Word 4']
  },
  'Practical Malware Analysis': {
    'author': 'Michael Sikorski',
    'words': ['Word 4', 'Word 5', 'Word 6']
  },
  'Foundation and Earth': {
    'author': 'Isaac Asimov',
    'words': ['Sibilant', 'Virility', 'Alacrity', 'Inveigled', 'Apocryphal']
  },
});

// final sectionListProvider =
//     StateProvider((_) => <String>['Chapter 1', 'Chapter 2', 'Chapter 3']);

// final wordListProvider = StateProvider((ref){
//   final bookList = ref.watch(bookListProvider);
//   final Map<String, List<String>> wordList = {};

//   bookList.forEach((key, value) {wordList[key] = ['Sibilant', 'Virility', 'Alacrity', 'Inveigled', 'Apocryphal'];});
//   return wordList;
// });

final mainNavIndexProvider = StateProvider((_) => 0);
final bookNavIndexProvider = StateProvider((_) => 0);
