import 'package:flutter/material.dart';

// ignore: todo
/// TODO：削除する。（ボトムナビゲーション動作チェック用）
class BookshelfPage extends StatelessWidget {
  const BookshelfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ehonapp")),
      body: const Text("絵本の棚"),
    );
  }
}
