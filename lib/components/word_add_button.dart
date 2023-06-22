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

          final TextEditingController wordController = TextEditingController();
          final TextEditingController meaningController = TextEditingController();
          
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('New word entry'),
                  content: Wrap(
                    children: [
                      TextField(
                        controller: wordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Word',
                        ),
                      ),
                      TextField(
                        controller: meaningController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Custom meaning',
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (wordController.text.isNotEmpty) {
                          final List<String> words = bookList[bookTitle]!['words'] as List<String>;
                          words.add(wordController.text);

                          ref.read(bookListProvider.notifier).state = {
                            ...bookList,
                            bookTitle: {
                              'author': bookList[bookTitle]!['author']!,
                              'words': words
                            }
                          };
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('You need to add a title!')));
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              });
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      );
  }
}