import 'package:flutter/material.dart';

/// TODO：削除する。（ボトムナビゲーション動作チェック用）
class BookshelfPage extends StatelessWidget {
  const BookshelfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("絵本の棚")),
      body: Text("絵本の棚"),
    );
  }
}
