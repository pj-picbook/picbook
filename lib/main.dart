import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/provider/analytics_provider.dart';
import 'package:picbook/presentation/bottom_navigation/bottom_navigation_page.dart';
import 'package:picbook/presentation/first_page/first_page.dart';
import 'common/logger_provider.dart';

Future<void> main() async {
  //Flutterフレームワーク外の特定のゾーンでスローされたエラーをキャッチする、クラッシュハンドラ
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    //Flutterフレームワーク内でスローされた全てのエラーを自動的にキャッチする、クラッシュハンドラ
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    runApp(
      const ProviderScope(
        child: App(),
      ),
    );
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.read(loggerProvider);
    final analytics = ref.watch(analyticsProvider);
    final authState = ref.watch(authStateProvider);
    return MaterialApp(
      title: 'memory',
      navigatorObservers: [analytics.observer],
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: HexColor('F8F5EE'),
        appBarTheme: AppBarTheme(
          backgroundColor: HexColor('F8F5EE'),
          titleTextStyle: TextStyle(
              color: HexColor('410000'),
              fontSize: 17,
              fontWeight: FontWeight.bold),
          elevation: 0.0,
        ),
      ),
      home: authState.when(
        data: (data) {
          if (data != null) {
            logger.i('user login');
            return const BottomNavigationPage();
          } else {
            logger.i('user logout');
            return const FirstPage();
          }
        },
        error: (e, trace) => const CircularProgressIndicator(),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
