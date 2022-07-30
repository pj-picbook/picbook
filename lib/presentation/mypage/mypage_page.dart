import 'package:flutter/material.dart';
import 'package:picbook/presentation/mypage/next_page.dart';

// ignore: todo
/// TODO：削除する。（ボトムナビゲーション動作チェック用）
class MypagePage extends StatelessWidget {
  const MypagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("マイページ")),
      body: Column(
        children: [
          const Text("マイページ"),
          ElevatedButton(
              child: const Text("次のページ"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NextPage()),
                );
              }),
        ],
      ),
    );
  }
}
