import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
                "アカウント情報",
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
            const TextButton(
              onPressed: null,
              child: const Text("アカウントを削除する"),
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
