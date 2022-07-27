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
          const SizedBox(height: 30),
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: const Center(
              child: Text(
                "ロゴ",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "アカウントをお持ちの方",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: null,
            child: Container(
              height: 50,
              width: 270,
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.red, width: 0.5),
              ),
              child: const Center(
                child: Text(
                  "ログイン",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "初めてご利用の方",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: null,
            child: Container(
              height: 50,
              width: 270,
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.red, width: 0.5),
              ),
              child: const Center(
                child: Text(
                  "メールアドレスで登録",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  const TextSpan(
                    text: "登録/ログインをすることで、",
                  ),
                  TextSpan(
                    text: "利用規約",
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(
                    text: "と",
                  ),
                  TextSpan(
                    text: "プライバシーポリシー",
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  ),
                  const TextSpan(
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
