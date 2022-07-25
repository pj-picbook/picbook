import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 30),
          Container(
            height: 200,
            width: 200,
            child: Center(
              child: Text(
                "ロゴ",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red), color: Colors.white12),
          ),
          SizedBox(height: 10),
          Text(
            "アカウントをお持ちの方",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextButton(
            child: Container(
              height: 50,
              width: 270,
              child: Center(
                child: Text(
                  "ログイン",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.red, width: 0.5),
              ),
            ),
            onPressed: null,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "初めてご利用の方",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextButton(
            child: Container(
              height: 50,
              width: 270,
              child: Center(
                child: Text(
                  "メールアドレスで登録",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.red, width: 0.5),
              ),
            ),
            onPressed: null,
          ),
          TextButton(
            child: Container(
              height: 50,
              width: 270,
              child: Center(
                child: Text(
                  "Googleで登録",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.red, width: 0.5),
              ),
            ),
            onPressed: null,
          ),
          TextButton(
            child: Container(
              height: 50,
              width: 270,
              child: Center(
                child: Text(
                  "Appleでサインアップ",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.red, width: 0.5),
              ),
            ),
            onPressed: null,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "登録/ログインをすることで、利用規約とプライバシーポリシーに同意したものとみなされます。",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
