import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/main.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<String>> bookList = ref.watch(bookListProvider);
    final int navIndex = ref.watch(navIndexProvider);

    List<Widget> _pages = <Widget>[
      ListView.builder(
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
            onTap: () {},
          );
        },
      ),
      const Icon(
        Icons.timeline_outlined,
        size: 150,
      ),
      const Icon(
        Icons.people_alt_rounded,
        size: 150,
      ),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: (index){
          ref.read(navIndexProvider.notifier).state = index;
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Quiz', icon: Icon(Icons.timeline_outlined)),
          BottomNavigationBarItem(
              label: 'Community', icon: Icon(Icons.people_alt_rounded)),
        ],
      ),
      appBar: AppBar(
        title: const Text('ReadLog'),
      ),
      body: _pages.elementAt(navIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          ref.read(bookListProvider.notifier).state = [
            ...bookList,
            ["New Book", "New Author"]
          ];

          // final TextEditingController titleController = TextEditingController();
          // final TextEditingController authorController = TextEditingController();
          
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return AlertDialog(
          //         title: const Text('Add Book'),
          //         content: Wrap(
          //           children: [
          //             TextField(
          //               controller: titleController,
          //               decoration: const InputDecoration(
          //                 border: OutlineInputBorder(),
          //                 labelText: 'Book Title',
          //               ),
          //             ),
          //             TextField(
          //               controller: authorController,
          //               decoration: const InputDecoration(
          //                 border: OutlineInputBorder(),
          //                 labelText: 'Author',
          //               ),
          //             ),
          //           ],
          //         ),
          //         actions: [
          //           TextButton(
          //             onPressed: () {
          //               Navigator.of(context).pop();
          //             },
          //             child: const Text('Cancel'),
          //           ),
          //           TextButton(
          //             onPressed: () {
          //               ref.read(bookListProvider.notifier).state = [
          //                 ...bookList,
          //                 [titleController.text, authorController.text]
          //               ];
          //               Navigator.of(context).pop();
          //             },
          //             child: const Text('Add'),
          //           ),
          //         ],
          //       );
          //     });
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      ),
    );
  }
}
