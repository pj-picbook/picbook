import 'package:flutter/material.dart';
import 'package:picbook/presentation/first_page/first_page.dart';
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
                child: const Text('MyPage')),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('hey!'),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
