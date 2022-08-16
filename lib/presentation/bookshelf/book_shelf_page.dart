import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picbook/presentation/searchbook/searchbook_page.dart';

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
class BookShelfPage extends StatelessWidget {
  const BookShelfPage({Key? key}) : super(key: key);

  /// ダミー用Widget作成用メソッド
  /// [height] 高さ
  /// [width] 横幅
  /// [color] 色
  /// return 高さ*幅サイズのカラー設定済みContainer
  Widget makeDummyItem(double height, double width, Color color) {
    return InkWell(
      onTap: () {
        // TODO タップ時の作品詳細画面遷移
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: height,
        width: width,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            (index) => makeDummyItem(dummyList[index].height,
                dummyList[index].height, dummyList[index].color),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SearchBookPage()));
        },
      ),
    );
  }
}
