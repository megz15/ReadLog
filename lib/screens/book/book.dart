import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readlog/providers.dart';
import 'book_info.dart';import 'book_words.dart';
import 'package:readlog/components/word_add_button.dart';

class Book extends ConsumerWidget {
  final String bookTitle;

  const Book({super.key, required this.bookTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int navIndex = ref.watch(bookNavIndexProvider);

    List<Widget> pages = <Widget>[const BookInfo(),BookGeneral(bookTitle: bookTitle)];

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
              label: 'Words', icon: Icon(Icons.question_mark)),
        ],
      ),
      body: pages.elementAt(navIndex),
      floatingActionButton: (navIndex==1) ? WordAddButton(bookTitle: bookTitle) : null,
    );
  }
}
