import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megz_readlog/providers.dart';

class SectionAddButton extends ConsumerWidget {
  const SectionAddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> bookList = ref.watch(sectionListProvider);
    return FloatingActionButton(
        onPressed: () {

          ref.read(sectionListProvider.notifier).state = [
            ...bookList,
            "Chapter X"
          ];
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      );
  }
}