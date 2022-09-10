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
        ),
        iconTheme: const IconThemeData(
          color: Colors.brown, //change your color here
        ),
      ),
      body: Form(
        child: Container(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "メールアドレス",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.brown, width: 0.5),
                ),
                child: TextFormField(
                  controller: emailController,
                  onChanged: ((value) => {notifier.setEmail(value)}),
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
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
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.brown, width: 0.5),
                ),
                child: TextFormField(
                  controller: passwordController,
                  onChanged: ((value) => {notifier.setPassword(value)}),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              ElevatedButton(
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
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
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
                                title: "お問い合わせフォーム",
                                url:
                                    "https://docs.google.com/forms/d/e/1FAIpQLSc1mHvSYh_bMLD6j5lZsBAdbP-jdViXPrJWbX_CSBMPZNbD0A/viewform",
                              ),
                            ),
                          );
                        },
                      style: TextStyle(
                        color: Colors.deepOrange.shade700,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
