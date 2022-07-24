import 'package:flutter/material.dart';
import 'package:picbook/presentation/mypage/next_page.dart';

/// TODO：削除する。（ボトムナビゲーション動作チェック用）
class MypagePage extends StatelessWidget {
  const MypagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("マイページ")),
      body: Column(
        children: [
          Text("マイページ"),
          ElevatedButton(
              child: Text("次のページ"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NextPage()),
                );
              }),
        ],
      ),
    );
  }
}
