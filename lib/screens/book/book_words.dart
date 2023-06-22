import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/providers.dart';

class BookGeneral extends ConsumerWidget {

  final String bookTitle;

  const BookGeneral({super.key, required this.bookTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookList = ref.watch(bookListProvider);
    List<String> words = bookList[bookTitle]!['words'] as List<String>;

    return ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(words[index]),
            trailing: IconButton(
              onPressed: () {
                // ref.read(wordListProvider.notifier).state = wordList
                //     .where((x) => wordList.indexOf(x) != index)
                //     .toList();
                // bookList[bookTitle]!.removeAt(index);
                // wordList.removeWhere((key, value) => key == wordList.keys.elementAt(index));

                words.removeAt(index);
                bookList[bookTitle]!['words'] = words;

                ref.read(bookListProvider.notifier).state = Map.from(bookList);
              },
              icon: const Icon(Icons.delete),
            ),
          );
        });
  }
}
