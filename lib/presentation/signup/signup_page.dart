import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/presentation/bottom_navigation_page.dart';
import 'package:picbook/presentation/signup/signup_page_view_model.dart';
import 'package:picbook/presentation/widget/bottom_picker.dart';
import '../agreement_page/agreement_page.dart';
import 'package:picbook/state/user_input_state.dart';

class SignUpPage extends HookConsumerWidget {
  String _name = "";
  String _email = "";
  String _password = "";
  //final DateTime? _dateTime = DateTime(2022, 01, 01);
  //final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final state = ref.watch(inputProvider);
    final notifier = ref.watch(inputProvider.notifier);
    return MaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      locale: const Locale('ja'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "会員登録",
            style: TextStyle(fontSize: 17.0, color: Colors.white),
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "なまえ",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
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
                    onChanged: (String name) {
                      _name = name;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "ご自身もしくはお子様の名前をご入力ください",
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
                    "生年月日",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
                // Container(
                //   height: 50,
                //   width: 300,
                //   decoration: BoxDecoration(
                //     color: Colors.white70,
                //     border: Border.all(color: Colors.red, width: 0.5),
                //   ),
                //   child: TextFormField(
                //     textAlign: TextAlign.center,
                //     decoration: const InputDecoration(
                //       border: InputBorder.none,
                //       hintText: "xxxx / xxx / xx",
                //       hintStyle: TextStyle(fontSize: 13.0),
                //     ),
                //   ),
                // ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border.all(color: Colors.red, width: 0.5),
                  ),
                  child: TextFormField(
                    onTap: () {
                      // _selectDate(context);
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
                                    //initialDateTime: _dateTime,
                                    onDateTimeChanged:
                                        (DateTime newDateTime) {},
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    //controller: _textEditingController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "xxxx / xxx / xx",
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
                    "メールアドレス",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
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
                    onChanged: (String email) {
                      _email = email;
                      // setState(() {
                      //   _email = email;
                      // });
                    },
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
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
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
                    onChanged: (String password) {},
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
                    onPressed: () {
                      var result = ref
                          .read(inputProvider.notifier)
                          .signUp(_email, _password);
                      if (result != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigationPage()));
                      } else {
                        print("登録失敗");
                      }
                    },
                    child: Text(
                      "登録する",
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
                                        )));
                          },
                        style: const TextStyle(
                          color: Colors.blue,
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
      ),
    );
  }
}
