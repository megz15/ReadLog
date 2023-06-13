import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/providers.dart';

class BookGeneral extends ConsumerWidget {
  const BookGeneral({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> wordList = ref.watch(wordListProvider);

    return ListView.builder(
        itemCount: wordList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(wordList[index]),
            trailing: IconButton(
              onPressed: () {
                ref.read(wordListProvider.notifier).state = wordList
                    .where((x) => wordList.indexOf(x) != index)
                    .toList();
              },
              icon: const Icon(Icons.delete),
            ),
          );
        });
  }
}
