import 'package:flutter/gestures.dart';
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
              color: Colors.black12,
            ),
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
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "登録/ログインをすることで、",
                  ),
                  TextSpan(
                    text: "利用規約",
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: "と",
                  ),
                  TextSpan(
                    text: "プライバシーポリシー",
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text: "に同意したものとみなされます。",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
