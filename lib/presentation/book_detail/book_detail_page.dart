import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:picbook/state/book_notifier.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widget/dialog.dart';

class BookDetailPage extends HookConsumerWidget {
  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(bookNotifierProvider);
    final bookNotifier = ref.watch(bookNotifierProvider.notifier);

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
                  onPressed: () {
                    bookNotifier.registerBook(book: bookState);
                    showAlertDialog(ref, title: '絵本の追加', content: '絵本を追加しました。');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add),
                        Text('登録する',
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
                  onPressed: () {
                    bookNotifier.deleteBook(book: bookState);
                    showAlertDialog(ref, title: '絵本の削除', content: '絵本を削除しました。');
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
