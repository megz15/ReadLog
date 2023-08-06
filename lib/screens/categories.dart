import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readlog/providers.dart';
import 'book/book.dart';

class Categories extends ConsumerWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookList = ref.watch(bookListProvider);

    return ListView.builder(
      itemCount: bookList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.book),
          title: Text(bookList.keys.elementAt(index)),
          subtitle: Text(bookList.values.elementAt(index)['author'].toString()),
          trailing: IconButton(
              onPressed: () {
                ref.read(bookListProvider.notifier).state = Map.from(bookList)..remove(bookList.keys.elementAt(index));
                // bookList.removeWhere((key, value) => key == bookList.keys.elementAt(index));
                // bookList.remove(bookList.keys.elementAt(index));
              },
              icon: const Icon(Icons.delete)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    Book(bookTitle: bookList.keys.elementAt(index))));
          },
        );
      },
    );
  }
}
