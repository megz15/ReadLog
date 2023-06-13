import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookListProvider = StateProvider((_) => <List<String>>[
  ['Elementary Linear Algebra', 'Andrilli, Hecker'],
  ['Practical Malware Analysis', 'Michael Sikorski'],
  ['Foundation and Earth', 'Isaac Asimov']]
);

final navIndexProvider = StateProvider((_) => 0);