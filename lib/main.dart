import 'package:flutter/material.dart';
import 'package:picbook/presentation/first_page/first_page.dart';
import 'package:picbook/presentation/mypage/mypage.dart';
import 'package:picbook/presentation/bottom_navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigationPage(),
    );
  }
}
