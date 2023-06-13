import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final String bookTitle;

  const Book({super.key, required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(bookTitle),
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              label: 'Info', icon: Icon(Icons.info_outline)),
          BottomNavigationBarItem(
              label: 'Sections', icon: Icon(Icons.library_books_outlined)),
          BottomNavigationBarItem(
              label: 'General', icon: Icon(Icons.question_mark)),
        ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  "https://3.bp.blogspot.com/_s6fUau_2za0/R5YpH8PboMI/AAAAAAAAAJU/pZse-0EZTJg/s0/356px-Foundation%27s_edge_cover.jpg",
                  height: 300,
                ),
                const Column(
                  children: [
                    Text("Foundation's Edge"),
                    Text("Isaac Asimov"),
                    Text("1982"),
                    Text("Science Fiction"),
                    Text("4.5"),
                  ],
                ),
              ],
            ), const Text('Lorem Ipsum dolor sit amet book info popipopipo')
          ],
        ));
  }
}
