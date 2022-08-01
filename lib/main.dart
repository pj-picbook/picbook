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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: HexColor('F8F5EE'),
        appBarTheme: AppBarTheme(
          backgroundColor: HexColor('F8F5EE'),
          titleTextStyle: TextStyle(
              color: HexColor('410000'),
              fontSize: 22,
              fontWeight: FontWeight.bold),
          elevation: 0.0,
        ),
      ),
      home: const BottomNavigationPage(),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
