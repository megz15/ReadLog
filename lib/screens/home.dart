import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/providers.dart';
import 'book/book.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<String>> bookList = ref.watch(bookListProvider);

    return ListView.builder(
      itemCount: bookList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.book),
          title: Text(bookList[index][0]),
          subtitle: Text(bookList[index][1]),
          trailing: IconButton(
              onPressed: () {
                ref.read(bookListProvider.notifier).state = bookList
                    .where((x) => bookList.indexOf(x) != index)
                    .toList();
              },
              icon: const Icon(Icons.delete)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    Book(bookTitle: bookList[index][0])));
          },
        );
      },
    );
  }
}
