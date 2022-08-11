import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/presentation/first_page/first_page.dart';
import 'package:picbook/presentation/mypage/mypage_notifier.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // MyPageNotifierProviderからstateを取得
    // 値はこちらから読み取る
    final state = ref.watch(myPageNotifierProvider);

    // MyPageNotifierProviderからnotifierを取得
    // メソッドはこちらから使う
    final notifier = ref.watch(myPageNotifierProvider.notifier);

    // 初期化処理
    useEffect(() {
      // useEffect内で非同期処理を行うため、別関数を定義
      Future<void> fetchUser() async {
        await notifier.fetch(id: 'umLDBXIjYX4EoGqtEwcI');
      }

      // 定義した関数を呼び出し
      fetchUser();
      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(180),
                child: Image.network(
                  'https://pbs.twimg.com/profile_images/1416944157642297344/uGjtCwxf_200x200.jpg',
                  width: 180,
                  height: 180,
                ),
              ),
            ),
            const SizedBox(
              width: 48,
            ),
            Row(
              children: <Widget>[
                const Text('なまえ'),
                // 表示するものがないのでとりあえずemailを表示しておく
                Text(state.email)
              ],
            ),
            Row(
              children: const <Widget>[Text('よんだえほん'), Text('２さつ')],
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute<MyPage>(
                          builder: (BuildContext context) => const FirstPage(),
                        ),
                      )
                    },
                child: const Text('FirstPage'))
          ],
        ),
      ),
    );
  }
}
