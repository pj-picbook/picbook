import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReAuthPage extends HookConsumerWidget {
  const ReAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'アカウント削除',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'パスワードを入力してください。',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
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
                // controller: passwordController,
                //onChanged: ((value) => {notifier.setPassword(value)}),
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 50,
                  width: 270,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('アカウントを削除する',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 14,
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
