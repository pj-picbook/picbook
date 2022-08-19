import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/main.dart';
import 'package:picbook/presentation/mypage/mypage_notifier.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:age_calculator/age_calculator.dart';

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
        await notifier.fetch();
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
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  'https://i.pinimg.com/236x/ef/78/70/ef7870383f8475f8ce487fc9d19bc6fb---orange-illustration.jpg',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            const SizedBox(
              width: 48,
              height: 20,
            ),
            Column(
              children: <Widget>[
                Text(state.currentBookshelf.owner,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('id:'),
                // 表示するものがないのでとりあえずidを表示しておく
                Text(state.user.id)
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Divider(
              color: HexColor('DBCCC4'),
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(
              height: 75,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.auto_stories,
                      color: Colors.pink,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                  const SizedBox(width: 110, child: Text('よんだえほん')),
                  SizedBox(
                    width: 30,
                    child: Text(
                      '${state.currentBookshelf.books.length}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Text('さつ'),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: HexColor('DBCCC4'),
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(
              height: 75,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 50,
                    child: const Icon(
                      Icons.cake,
                      color: Colors.pink,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                  const SizedBox(width: 110, child: Text('ねんれい')),
                  SizedBox(
                    width: 30,
                    child: Text(
                      AgeCalculator.age(state.currentBookshelf.ownerBirthday)
                          .years
                          .toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Text('さい'),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: HexColor('DBCCC4'),
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(
              height: 75,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.calendar_month,
                      color: Colors.pink,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                  const SizedBox(width: 110, child: Text('とうろくび')),
                  Text(
                    state.currentBookshelf.created.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: HexColor('DBCCC4'),
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () async {
                await notifier.logOut();
                (() => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<App>(
                      builder: (context) => const App(),
                    ),
                    (route) => false))();
              },
              child: Container(
                height: 50,
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.red, width: 0.5),
                ),
                child: const Center(
                  child: Text(
                    "ログアウトする",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
