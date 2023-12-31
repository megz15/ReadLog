import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readlog/providers.dart';

class BookAddButton extends ConsumerWidget {
  const BookAddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookList = ref.watch(bookListProvider);
    return FloatingActionButton(
        onPressed: () {

          // ref.read(bookListProvider.notifier).state = {
          //   ...bookList,
          //   "New Book": ["New Author", ["w1, w2"]]
          // };

          final TextEditingController titleController = TextEditingController();
          final TextEditingController authorController = TextEditingController();
          
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add Book'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Book Title',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: authorController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Author',
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
                        if (titleController.text.isNotEmpty) {
                          ref.read(bookListProvider.notifier).state = {
                            ...bookList,
                            titleController.text: {
                              'author': authorController.text,
                              'words': <String>[]
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