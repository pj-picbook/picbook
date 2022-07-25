import 'package:flutter/material.dart';
import 'package:picbook/common/dummy_data.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              children: <Widget>[const Text('なまえ'), Text(dummyUser.name)],
            ),
            Row(
              children: <Widget>[
                const Text('よんだえほん'),
                Text('${dummyUser.bookshelfs.length}さつ')
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  // ignore: avoid_print
                  print('pushed!');
                },
                child: const Text('ログアウトする'))
          ],
        ),
      ),
    );
  }
}
