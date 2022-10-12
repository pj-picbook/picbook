import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/presentation/account_page/account_page_notifier.dart';
import 'package:picbook/presentation/reauth_page/reauth_page.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(accountPageNotifierProvider.notifier);
    final state = ref.watch(accountPageNotifierProvider);

    useEffect(() {
      notifier.fetch();
      return null;
    });
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
              trailing: Text(
                state.email,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ReAuthPage()));
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
