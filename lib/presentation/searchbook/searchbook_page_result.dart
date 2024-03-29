import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/presentation/book_detail/book_detail_page.dart';
import 'package:picbook/state/book_notifier.dart';
import '../../presentation/searchbook/searchbook_page_notifier.dart';
import '../widget/book_box.dart';
import '../widget/dialog.dart';
import 'package:picbook/presentation/bookshelf/bookshelf_notifier.dart';

class SearchBookResultPage extends HookConsumerWidget {
  const SearchBookResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rakutenBookPageNotifierProvider);
    final bookNotifier = ref.watch(bookNotifierProvider.notifier);
    final bookshelfNotifier = ref.read(bookshelfNotifierProvider.notifier);
    final bookshelfState = ref.watch(bookshelfNotifierProvider);

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
            const SizedBox(
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
                          if (bookshelfState.registered.contains(item.isbn)) {
                            return;
                          }

                          await bookNotifier.registerBook(book: item);

                          //TODO:登録できなかった場合どうするか
                          showAlertDialog(ref,
                              title: '絵本の追加', content: '絵本を追加しました。');

                          await bookshelfNotifier.fetchAll();
                        },
                        book: item,
                        isRegistered:
                            bookshelfState.registered.contains(item.isbn),
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
            ),
          ],
        ),
      ),
    );
  }
}
