import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/providers.dart';

class WordAddButton extends ConsumerWidget {
  const WordAddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> bookList = ref.watch(wordListProvider);
    return FloatingActionButton(
        onPressed: () {
          ref.read(wordListProvider.notifier).state = [
            ...bookList,
            "word"
          ];
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      );
  }
}