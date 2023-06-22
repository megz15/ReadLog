import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/providers.dart';

class WordAddButton extends ConsumerWidget {

  final String bookTitle;

  const WordAddButton({super.key, required this.bookTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookList = ref.watch(bookListProvider);
    return FloatingActionButton(
        onPressed: () {
          print(bookList);
          // bookList[bookTitle] = [bookList[bookTitle]![0], bookList[bookTitle]![1]];
          bookList[bookTitle]!['words'];
          // ref.read(bookListProvider.notifier).state = bookList;
          ref.read(bookListProvider.notifier).state = {
            ...bookList,
            bookTitle: {
              'author': bookList[bookTitle]!['author']!,
              'words': ['sex']
            }
          };
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      );
  }
}