import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/main.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<String>> bookList = ref.watch(bookListProvider);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(bookList[index][0]),
            subtitle: Text(bookList[index][1]),
            trailing: const Icon(Icons.more_vert),
            onTap: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(bookListProvider.notifier).state = [
            ...bookList,
            ['New Book', 'New Author']
          ];
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      ),
    );
  }
}
