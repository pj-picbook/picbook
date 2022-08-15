import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/main.dart';
import 'package:picbook/presentation/login/login_notifier.dart';

import '../agreement_page/agreement_page.dart';

class LogInPage extends HookConsumerWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginNotifierProvider.notifier);
    final emailController = useTextEditingController(text: "");
    final passwordController = useTextEditingController(text: "");
    final logger = ref.read(loggerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ログイン",
          style: TextStyle(fontSize: 17.0, color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Form(
        child: Container(
          color: Colors.grey[300],
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "メールアドレス",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.red, width: 0.5),
                ),
                child: TextFormField(
                  controller: emailController,
                  onChanged: ((value) => {notifier.setEmail(value)}),
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "xxxxxx@xxxxxxxxxxx",
                    hintStyle: TextStyle(fontSize: 13.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "パスワード",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.red, width: 0.5),
                ),
                child: TextFormField(
                  controller: passwordController,
                  onChanged: ((value) => {notifier.setPassword(value)}),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "………………………",
                    hintStyle: TextStyle(fontSize: 13.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.red, width: 0.5),
                ),
                child: TextButton(
                  onPressed: () async {
                    try {
                      await notifier.logIn();
                      (() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<App>(
                            builder: (context) => const App(),
                          ),
                          (route) => false))();
                    } catch (e) {
                      logger.e(e);
                    }
                  },
                  child: const Text(
                    "ログインする",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    const TextSpan(
                      text: "パスワードを忘れた方は",
                    ),
                    TextSpan(
                      text: "こちら",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AgreementPage(
                                title: "利用規約",
                                url:
                                    "https://pj-picbook.github.io/picdoc/docs/terms.html",
                              ),
                            ),
                          );
                        },
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
