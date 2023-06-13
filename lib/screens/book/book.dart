import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/providers.dart';
import 'book_export.dart';
import 'package:megz_readlog/components/components.dart';

class Book extends ConsumerWidget {
  final String bookTitle;

  const Book({super.key, required this.bookTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int navIndex = ref.watch(bookNavIndexProvider);

    const List<Widget> pages = <Widget>[
      BookInfo(),
      BookSections(),
      BookGeneral(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(bookTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: (index) {
          ref.read(bookNavIndexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Info', icon: Icon(Icons.info_outline)),
          BottomNavigationBarItem(
              label: 'Sections', icon: Icon(Icons.library_books_outlined)),
          BottomNavigationBarItem(
              label: 'General', icon: Icon(Icons.question_mark)),
        ],
      ),
      body: pages.elementAt(navIndex),
      floatingActionButton: (navIndex == 1) ? const SectionAddButton() : (navIndex == 2) ? const WordAddButton() : null,
    );
  }
}
