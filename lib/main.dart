import 'package:flutter/material.dart';
import 'package:picbook/presentation/mypage/mypage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute<MyPage>(
                          builder: (BuildContext context) => const MyPage(),
                        ),
                      )
                    },
                child: const Text('MyPage'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: avoid_print
        onPressed: () => print('hey!'),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
