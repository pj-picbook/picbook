import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:picbook/presentation/bottom_navigation_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'picbook',
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
