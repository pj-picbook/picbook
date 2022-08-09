import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../presentation/searchbook/searchbook_page_notifier.dart';
import '../widget/book_box.dart';

class SearchBookPage extends HookConsumerWidget {
  const SearchBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rakutenBookPageNotifierProvider);
    final notifier = ref.watch(rakutenBookPageNotifierProvider.notifier);
    final textFieldController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '検索画面',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: textFieldController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '検索キーワード',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.qr_code),
                ),
                onEditingComplete: () async {
                  await notifier.fetch(keyWord: textFieldController.text);
                },
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final item = state.books[index];
                  return BookBox(
                    book: item,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
