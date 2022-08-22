import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:picbook/infrastructure/rakuten_book_repository.dart';
import 'package:picbook/presentation/book_detail/book_detail_page.dart';
import '../../presentation/searchbook/searchbook_page_notifier.dart';
import '../widget/book_box.dart';
import '../widget/dialog.dart';
import '../barcode_scanner_page/barcode_scanner_page.dart';

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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: '検索キーワード',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    child: const Icon(Icons.qr_code),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BarcodeScannerPage()),
                      );
                    },
                  ),
                ),
                onEditingComplete: () async {
                  await notifier.fetch(
                      searchType: SearchType.keyword,
                      keyWord: textFieldController.text);
                },
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final item = state.books[index];
                  return InkWell(
                      child: BookBox(
                        onPressed: () async {
                          notifier.registerBook(book: item);
                          showAlertDialog(ref,
                              title: '本の追加', content: '本の追加が完了しました');
                        },
                        book: item,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const BookDetailPage()),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
