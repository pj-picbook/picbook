import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/rakuten_book_repository.dart';
import 'package:picbook/presentation/book_detail/book_detail_page.dart';
import 'package:picbook/state/book_notifier.dart';
import '../../presentation/searchbook/searchbook_page_notifier.dart';
import '../widget/book_box.dart';
import '../widget/dialog.dart';
import '../barcode_scanner_page/barcode_scanner_page.dart';

class CategoryResultPage extends HookConsumerWidget {
  const CategoryResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rakutenBookPageNotifierProvider);
    final notifier = ref.watch(rakutenBookPageNotifierProvider.notifier);
    final textFieldController = useTextEditingController();
    final bookNotifier = ref.watch(bookNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.brown, //change your color here
        ),
        centerTitle: true,
        title: const Text(
          '検索結果',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final item = state.books[index];
                  return InkWell(
                      child: BookBox(
                        onPressed: () async {
                          bookNotifier.registerBook(book: item);
                          showAlertDialog(ref,
                              title: '絵本の追加', content: '絵本を追加しました。');
                        },
                        book: item,
                      ),
                      onTap: () {
                        bookNotifier.set(item);
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
