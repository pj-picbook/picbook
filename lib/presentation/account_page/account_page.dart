import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'アカウント',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(
              color: Colors.black,
              thickness: 0.6,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text(
                "メールアドレス",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              trailing: const Text(
                "email",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AccountPage()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.6,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                showCupertinoDialog(
                  context: (context),
                  builder: (_) => CupertinoAlertDialog(
                    title: const Text("アカウントを削除"),
                    content:
                        const Text("アカウントを削除するとログインできなくなります。アカウントを削除しますか？"),
                    actions: [
                      CupertinoDialogAction(
                        child: TextButton(
                          child: const Text(
                            "キャンセル",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ),
                      ),
                      const CupertinoDialogAction(
                        child: TextButton(
                          onPressed: null,
                          child: Text(
                            "削除する",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                "アカウントを削除する",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
