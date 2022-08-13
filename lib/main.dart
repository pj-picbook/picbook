import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/presentation/bottom_navigation_page.dart';
import 'package:picbook/presentation/first_page/first_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
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
      // home: const FirstPage(),
      home: authState.when(
        data: (data) =>
            data != null ? const BottomNavigationPage() : const FirstPage(),
        error: (e, trace) => const CircularProgressIndicator(),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
