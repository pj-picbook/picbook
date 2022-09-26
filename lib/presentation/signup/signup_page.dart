import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/presentation/widget/bottom_picker.dart';
import '../../main.dart';
import '../agreement_page/agreement_page.dart';
import 'package:intl/intl.dart';
import 'signup_notifier.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signUpNotifierProvider.notifier);
    final emailController = useTextEditingController(text: "");
    final passwordController = useTextEditingController(text: "");
    final birthdayController = useTextEditingController(text: "");
    final logger = ref.read(loggerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "会員登録",
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.brown, //change your color here
        ),
      ),
      body: Form(
        child: Container(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.key,
                      color: HexColor('410000'),
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                  Center(
                    child: Text(
                      "ログイン情報",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: HexColor('410000'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
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
                height: 10.0,
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
                height: 40.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.person_add,
                      color: HexColor('410000'),
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                  Center(
                    child: Text(
                      "絵本を読む人の情報",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: HexColor('410000'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "なまえ",
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
                  textAlign: TextAlign.center,
                  onChanged: (value) => notifier.setName(value),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "生年月日",
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
                  readOnly: true,
                  controller: birthdayController,
                  onTap: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xffffffff),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xff999999),
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CupertinoButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 5.0,
                                      ),
                                      child: const Text(
                                        'キャンセル',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    CupertinoButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 5.0,
                                      ),
                                      child: const Text(
                                        '追加',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              bottomPicker(
                                CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (DateTime newDateTime) {
                                    notifier.setBirthday(newDateTime);
                                    birthdayController.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(newDateTime)
                                            .toString();
                                  },
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 13.0),
                    hintText: '未入力の場合は、登録した日に設定されます',
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  border: Border.all(color: Colors.brown, width: 0.5),
                ),
                child: TextButton(
                  onPressed: () async {
                    try {
                      await notifier.signUp();
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
                  child: const Text(
                    "登録する",
                    style: TextStyle(
                      color: Colors.white,
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
                      text: "「登録する」ボタンを押すことで、",
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
                    const TextSpan(
                      text: "に同意したものとみなします。",
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
