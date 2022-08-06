import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:image_network/image_network.dart';
import '../../presentation/searchbook/searchbook_page_notifier.dart';
import '../../domain/entity/book.dart';

class SearchBookPage extends StatelessWidget {
  const SearchBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 26, 35, 126),
        centerTitle: true,
        title: const Text(
          '検索画面',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _SearchBookPage(),
    );
  }
}

class _SearchBookPage extends HookConsumerWidget {
  _SearchBookPage({Key? key}) : super(key: key);

  final TextEditingController textFieldEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rakutenBookPageNotifierProvider);

    final notifier = ref.watch(rakutenBookPageNotifierProvider.notifier);

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: textFieldEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '検索キーワード',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.qr_code),
              ),
              onEditingComplete: () async {
                await notifier.fetch(keyWord: textFieldEditingController.text);
              },
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final item = state.books[index];
                return _BookBox(
                  book: item,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _BookBox extends StatelessWidget {
  const _BookBox({required this.book, Key? key}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 5),
                child: ImageNetwork(
                  image: book.smallImageUrl,
                  height: 60,
                  width: 50,
                  fitAndroidIos: BoxFit.contain,
                  onLoading: SkeletonAnimation(
                    child: Container(
                      color: const Color.fromARGB(70, 125, 125, 125),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      book.title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      book.author,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 184, 180, 180),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.add_box,
                color: Colors.black38,
                size: 30,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.black12,
          thickness: 3,
          height: 10,
          indent: 10,
        ),
      ],
    );
  }
}
