import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/providers.dart';

class BookSections extends ConsumerWidget {
  const BookSections({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> sectionList = ref.watch(sectionListProvider);

    return ListView.builder(
        itemCount: sectionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(sectionList[index]),
            trailing: IconButton(
              onPressed: () {
                ref.read(sectionListProvider.notifier).state = sectionList
                    .where((x) => sectionList.indexOf(x) != index)
                    .toList();
              },
              icon: const Icon(Icons.delete),
            ),
          );
        });
  }
}
