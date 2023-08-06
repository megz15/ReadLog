import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/screens.dart';
import 'components/book_add_button.dart';
import 'providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReadLog',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Base(),
    );
  }
}

class Base extends ConsumerWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int navIndex = ref.watch(mainNavIndexProvider);

    const List<Widget> pages = <Widget>[General(), Categories(), Quiz(), Community()];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navIndex,
        onTap: (index) {
          ref.read(mainNavIndexProvider.notifier).state = index;
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: 'General', icon: Icon(Icons.home_rounded)),
          BottomNavigationBarItem(label: 'Categories', icon: Icon(Icons.category_rounded)),
          // BottomNavigationBarItem(
          //     label: 'Swift', icon: Icon(Icons.electric_bolt)),
          BottomNavigationBarItem(
              label: 'Quiz', icon: Icon(Icons.timeline_outlined)),
          BottomNavigationBarItem(
              label: 'Community', icon: Icon(Icons.people_alt_rounded)),
        ],
      ),
      appBar: AppBar(
        title: const Text('ReadLog'),
      ),
      body: pages.elementAt(navIndex),
      floatingActionButton: (navIndex < 2) ? const BookAddButton() : null,
    );
  }
}