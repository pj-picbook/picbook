import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/common/dummy_data.dart';
import 'package:picbook/presentation/first_page/first_page.dart';
import 'package:picbook/presentation/mypage/mypage_notifier.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageNotifierProvider);
    final notifier = ref.watch(myPageNotifierProvider.notifier);
    useEffect(() {
      Future<void> fetchUser() async {
        await notifier.fetch(id: 'umLDBXIjYX4EoGqtEwcI');
      }

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
              children: <Widget>[const Text('なまえ'), Text(state.name)],
            ),
            Row(
              children: <Widget>[
                const Text('よんだえほん'),
                Text('${dummyUser.bookshelfs.length}さつ')
              ],
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
