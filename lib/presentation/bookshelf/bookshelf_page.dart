import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/common/dummy_data.dart'; // TODO:削除する。ダミーデータを参照するため使用
import 'package:picbook/presentation/book_detail/book_detail_page.dart';
import 'package:picbook/state/book_notifier.dart';
import 'package:picbook/presentation/searchbook/searchbook_page.dart';
import 'package:hexcolor/hexcolor.dart';

class Book {
  double height;
  double width;
  Color color;

  Book(this.height, this.width, this.color);
}

List<Book> dummyList = [
  Book(200, 100, Colors.red),
  Book(300, 200, Colors.blue),
  Book(400, 150, Colors.orange),
  Book(200, 100, Colors.green),
  Book(300, 150, Colors.purpleAccent),
  Book(100, 100, Colors.lightGreenAccent),
  Book(300, 200, Colors.yellow),
  Book(200, 100, Colors.teal),
  Book(400, 150, Colors.indigoAccent),
  Book(300, 150, Colors.redAccent)
];

/// 本棚画面クラス
class BookshelfPage extends HookConsumerWidget {
  const BookshelfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookNotifier = ref.watch(bookNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('絵本の棚'),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          children: List.generate(
            dummyList.length, // TODO ここで利用するリストはFirebaseから取得した情報群
            (index) => InkWell(
              onTap: () {
                // 作品詳細画面に表示するデータをセットする
                // TODO:dummyBookを正規のデータと入れ替える
                bookNotifier.set(dummyBookForBookshelf);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const BookDetailPage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                height: dummyList[index].height,
                width: dummyList[index].height,
                color: dummyList[index].color,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: HexColor('AB4934'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SearchBookPage()));
        },
      ),
    );
  }
}
