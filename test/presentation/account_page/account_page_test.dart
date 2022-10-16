import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/presentation/account_page/account_page.dart';

import '../../mock/container.dart';
import '../../mock/container.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockLogger mockLogger;
  late MockAuthRepository authRepository;

  setUp(() {
    container = overrideContainer();
    mockLogger = container.read(loggerProvider) as MockLogger;
    authRepository =
        container.read(authRepositoryProvider) as MockAuthRepository;
  });

  group('account_page', () {
    testWidgets('初期描画時にemailが表示されること', (tester) async {
      // ユーザー情報をmockにセット
      when(authRepository.getEmail()).thenReturn('test_email@example.com');

      await tester.runAsync(
        () async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                loggerProvider.overrideWithValue(mockLogger),
                authRepositoryProvider.overrideWithValue(authRepository),
              ],
              // この辺は描画に必要なものを適当に作成
              child: MaterialApp(
                title: 'MyPage Widget Test',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: const AccountPage(),
              ),
            ),
          );
        },
      );

      // 描画が終わるまで待機する
      await tester.pumpAndSettle();

      expect(find.text('test_email@example.com'), findsOneWidget);
    });
  });
}
