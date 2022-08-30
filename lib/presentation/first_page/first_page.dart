import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:picbook/presentation/agreement_page/agreement_page.dart';
import 'package:picbook/presentation/login/login_page.dart';
import '../signup/signup_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 30),
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(),
            child: Image.asset('lib/assets/images/splash.png'),
          ),
          const Text(
            "アカウントをお持ちの方",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogInPage(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 270,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("ログイン",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                        )),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "初めてご利用の方",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 270,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("メールアドレスで登録",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                        )),
                  ],
                ),
              )),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
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
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AgreementPage(
                                      title: "利用規約",
                                      url:
                                          "https://pj-picbook.github.io/picdoc/docs/terms.html",
                                    )));
                      },
                    style: TextStyle(
                      color: Colors.deepOrange.shade700,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(
                    text: "と",
                  ),
                  TextSpan(
                    text: "プライバシーポリシー",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AgreementPage(
                                    title: "プライバシーポリシー",
                                    url:
                                        "https://pj-picbook.github.io/picdoc/docs/privacypolicy.html")));
                      },
                    style: TextStyle(
                        color: Colors.deepOrange.shade700,
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
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
