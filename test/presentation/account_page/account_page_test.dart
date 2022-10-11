import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:picbook/common/dummy_data.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/analytics_service.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/books_repository.dart';
import 'package:picbook/infrastructure/bookshelf_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/presentation/account_page/account_page.dart';

import '../../mock/container.dart';
import '../../mock/container.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockAnalyticsService mockAnalyticsService;
  late MockLogger mockLogger;
  late MockUserRepository userRepository;
  late MockAuthRepository authRepository;
  late MockBookshelfRepository bookshelfRepository;
  late MockBooksRepository booksRepository;

  setUp(() {
    container = overrideContainer();
    mockLogger = container.read(loggerProvider) as MockLogger;
    mockAnalyticsService =
        container.read(analyticsServiceProvider) as MockAnalyticsService;
    userRepository =
        container.read(userRepositoryProvider) as MockUserRepository;
    authRepository =
        container.read(authRepositoryProvider) as MockAuthRepository;
    bookshelfRepository =
        container.read(bookshelfRepositoryProvider) as MockBookshelfRepository;
    booksRepository =
        container.read(booksRepositoryProvider) as MockBooksRepository;
  });

  group('account_page', () {
    testWidgets('初期描画時にdummyUserの情報が画面に描画されること', (tester) async {
      when(mockAnalyticsService.sendButtonEvent(buttonName: 'ログアウト'))
          .thenAnswer((_) => Future.value(null));
      // ユーザー情報をmockにセット
      when(authRepository.getUid()).thenAnswer((_) => 'test_uid');
      when(userRepository.findById(id: 'test_uid'))
          .thenAnswer((_) => Future.value(dummyUser));
      when(bookshelfRepository.fetchAll(uid: 'test_uid'))
          .thenAnswer((_) => Future.value([dummyBookshelf]));
      when(booksRepository.fetchAll(
              uid: 'test_uid', bookshelfId: 'bookshelf_id'))
          .thenAnswer((_) => Future.value(dummyBooks));

      // Image.networkがUIにある場合はこれで包む
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(
            ProviderScope(
              // userRepositoryをmockでoverrideする
              overrides: [
                loggerProvider.overrideWithValue(mockLogger),
                analyticsServiceProvider
                    .overrideWithValue(mockAnalyticsService),
                userRepositoryProvider.overrideWithValue(userRepository),
                authRepositoryProvider.overrideWithValue(authRepository),
                bookshelfRepositoryProvider
                    .overrideWithValue(bookshelfRepository),
                booksRepositoryProvider.overrideWithValue(booksRepository)
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

      expect(find.text(dummyBookshelf.owner), findsOneWidget);
      expect(find.text(dummyUser.id), findsOneWidget);
      expect(find.text(dummyBooks.length.toString()), findsOneWidget);
    });
  });
}
