import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// 本棚画面クラス
class BookShelfPage extends StatelessWidget {
  BookShelfPage({Key? key}) : super(key: key);

  // TODO ダミーリスト
  // 将来的にはここはFirebaseから取得した情報で置き換わる
  final dummyList = [
    makeDummyItem(200, 100, Colors.red),
    makeDummyItem(300, 200, Colors.blue),
    makeDummyItem(400, 150, Colors.orange),
    makeDummyItem(200, 100, Colors.green),
    makeDummyItem(300, 150, Colors.purpleAccent),
    makeDummyItem(100, 100, Colors.lightGreenAccent),
    makeDummyItem(300, 200, Colors.yellow),
    makeDummyItem(200, 100, Colors.teal),
    makeDummyItem(400, 150, Colors.indigoAccent),
    makeDummyItem(300, 150, Colors.redAccent)
  ];

  /// ダミー用Widget作成用メソッド
  /// [height] 高さ
  /// [width] 横幅
  /// [color] 色
  /// return 高さ*幅サイズのカラー設定済みContainer
  static Widget makeDummyItem(double height, double width, Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: height,
      width: width,
      color: color,
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
            dummyList.length,// TODO ここで利用するリストはFirebaseから取得した情報群
            (index) => dummyList[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO 検索一覧画面に遷移する
        },
      ),
    );
  }
}
