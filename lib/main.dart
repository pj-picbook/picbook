import 'package:flutter/material.dart';
import 'package:picbook/presentation/bottom_navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'picbook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigationPage(),
    );
  }
}
