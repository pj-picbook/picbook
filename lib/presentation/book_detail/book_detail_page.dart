import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:picbook/state/book_notifier.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widget/dialog.dart';
import '../../presentation/bookshelf/bookshelf_notifier.dart';

class BookDetailPage extends HookConsumerWidget {
  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(bookNotifierProvider);
    final bookNotifier = ref.watch(bookNotifierProvider.notifier);
    final bookshelfNotifier = ref.read(bookshelfNotifierProvider.notifier);
    final bookshelfState = ref.watch(bookshelfNotifierProvider);

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.brown, //change your color here
          ),
          title: Text("${bookState.title}")),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: HexColor('ffefdb'), //書影背景色
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Row(
              children: [
                const Spacer(),
                ImageNetwork(
                  image: "${bookState.largeImageUrl}",
                  height: 250,
                  width: 200,
                  fitAndroidIos: BoxFit.contain,
                  onLoading: SkeletonAnimation(
                    child: Container(
                      color: const Color.fromARGB(70, 125, 125, 125),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("${bookState.title}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text("作：${bookState.author}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                  )),
              Text("出版社：${bookState.publisherName}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text("${bookState.itemCaption}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary:
                          bookshelfState.registered.contains(bookState.isbn)
                              ? Colors.brown[200]
                              : Colors.brown),
                  onPressed: () async {
                    if (bookshelfState.registered.contains(bookState.isbn)) {
                      return;
                    }

                    await bookNotifier.registerBook(book: bookState);
                    showAlertDialog(ref, title: '絵本の追加', content: '絵本を追加しました。');
                    await bookshelfNotifier.fetchAll();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        bookshelfState.registered.contains(bookState.isbn)
                            ? Icon(
                                Icons.check,
                                color: bookshelfState.registered
                                        .contains(bookState.isbn)
                                    ? Colors.brown[100]
                                    : Colors.white,
                              )
                            : Icon(
                                Icons.add,
                                color: bookshelfState.registered
                                        .contains(bookState.isbn)
                                    ? Colors.brown[100]
                                    : Colors.white,
                              ),
                        Text(
                            bookshelfState.registered.contains(bookState.isbn)
                                ? ' 登録済み'
                                : '登録する',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                              color: bookshelfState.registered
                                      .contains(bookState.isbn)
                                  ? Colors.brown[100]
                                  : Colors.white,
                            )),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (bookshelfState.registered.contains(bookState.isbn) ==
                        false) {
                      showAlertDialog(ref,
                          title: '読んだ絵本の追加に失敗', content: '本棚に登録してください。');
                      return;
                    }

                    await bookNotifier.readBook(book: bookState);
                    showAlertDialog(ref,
                        title: '読んだ絵本の追加', content: '読んだ絵本を追加しました。');
                    await bookshelfNotifier.fetchAll();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.menu_book),
                        Text('読んだ',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () async {
                    //TODO:失敗した処理は別で考える
                    await bookNotifier.deleteBook(
                        book: bookState,
                        finishCallback: () async {
                          Navigator.pop(context);
                          showAlertDialog(ref,
                              title: '絵本の削除', content: '絵本を削除しました。');
                          await bookshelfNotifier.fetchAll();
                        });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.delete),
                        Text('削除する',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  )),
            ]),
          )
        ]),
      ),
    );
  }
}
