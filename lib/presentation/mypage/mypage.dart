import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/analytics_service.dart';
import 'package:picbook/main.dart';
import 'package:picbook/presentation/mypage/mypage_notifier.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:age_calculator/age_calculator.dart';
import 'package:intl/intl.dart';

import '../account_page/account_page.dart';
import '../widget/bookshelf_histry_bar_graph.dart';

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

    // 試しにanalyticsでボタンイベント送信する用
    final analytics = ref.read(analyticsServiceProvider);

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
        centerTitle: true,
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            return await notifier.fetch();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Flexible(
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(150),
                //     child: Image.network(
                //       'https://i.pinimg.com/236x/ef/78/70/ef7870383f8475f8ce487fc9d19bc6fb---orange-illustration.jpg',
                //       width: 150,
                //       height: 150,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  width: 48,
                  height: 20,
                ),
                if (state.bookshelfHistory.isNotEmpty)
                  BookshelfHistoryBarChart(
                    width: 380,
                    height: 250,
                    bookshelfHistory: state.bookshelfHistory,
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
                      SizedBox(
                        width: 50,
                        child: Icon(
                          Icons.auto_stories,
                          color: Colors.deepOrange.shade700,
                          size: 24.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                      ),
                      const SizedBox(width: 110, child: Text('よんだえほん')),
                      SizedBox(
                        width: 30,
                        child: Text(
                          '${state.books?.length ?? 0}',
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
                // const SizedBox(
                //   height: 5,
                // ),
                // Divider(
                //   color: HexColor('DBCCC4'),
                //   thickness: 1,
                //   height: 0,
                //   indent: 0,
                //   endIndent: 0,
                // ),
                // SizedBox(
                //   height: 75,
                //   child: Row(
                //     children: <Widget>[
                //       SizedBox(
                //         width: 50,
                //         child: Icon(
                //           Icons.cake,
                //           color: Colors.deepOrange.shade700,
                //           size: 24.0,
                //           semanticLabel:
                //               'Text to announce in accessibility modes',
                //         ),
                //       ),
                //       const SizedBox(width: 110, child: Text('ねんれい')),
                //       SizedBox(
                //         width: 30,
                //         child: Text(
                //           AgeCalculator.age(
                //                   state.currentBookshelf.ownerBirthday)
                //               .years
                //               .toString(),
                //           style: const TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //           ),
                //         ),
                //       ),
                //       const Text('さい'),
                //     ],
                //   ),
                // ),
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
                      SizedBox(
                        width: 50,
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.deepOrange.shade700,
                          size: 24.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                      ),
                      const SizedBox(width: 110, child: Text('とうろくび')),
                      Text(
                        DateFormat('yyyy-MM-dd')
                            .format(state.currentBookshelf.created),
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
                  height: 10,
                ),
                ListTile(
                  minLeadingWidth: 10,
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.deepOrange.shade700,
                    size: 24.0,
                  ),
                  title: const Text(
                    "アカウント情報",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const AccountPage()));
                  },
                ),
                const SizedBox(
                  height: 10,
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
                ElevatedButton(
                    onPressed: () async {
                      await notifier.logOut();
                      await analytics.sendButtonEvent(buttonName: 'ログアウト');
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
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('ログアウトする',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 16,
                              )),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
