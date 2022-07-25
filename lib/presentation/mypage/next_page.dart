import 'package:flutter/material.dart';

/// TODO：削除する。（ボトムナビゲーション動作チェック用）
class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("次のページ")),
      body: Text("次のページ"),
    );
  }
}
