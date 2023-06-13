import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookListProvider = StateProvider((_) => <List<String>>[
      ['Elementary Linear Algebra', 'Andrilli, Hecker'],
      ['Practical Malware Analysis', 'Michael Sikorski'],
      ['Foundation and Earth', 'Isaac Asimov']
    ]);

final sectionListProvider =
    StateProvider((_) => <String>['Chapter 1', 'Chapter 2', 'Chapter 3']);

final wordListProvider = StateProvider((_) =>
    <String>['Sibilant', 'Virility', 'Alacrity', 'Inveigled', 'Apocryphal']);

final mainNavIndexProvider = StateProvider((_) => 0);
final bookNavIndexProvider = StateProvider((_) => 0);
