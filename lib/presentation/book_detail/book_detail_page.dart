import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:picbook/state/book_notifier.dart';
import 'package:skeleton_text/skeleton_text.dart';

class BookDetailPage extends HookConsumerWidget {
  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(bookNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text("${bookState.title}")),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: const Color.fromARGB(255, 252, 215, 227),
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
                    // TODO:#58のタスク→firebaseに登録する
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
            ]),
          )
        ]),
      ),
    );
  }
}