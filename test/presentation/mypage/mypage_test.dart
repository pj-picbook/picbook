import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:picbook/common/dummy_data.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/presentation/mypage/mypage.dart';

import '../../mock/container.dart';
import '../../mock/container.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockUserRepository repository;

  setUp(() {
    container = overrideUserRepository();
    repository = container.read(userRepositoryProvider) as MockUserRepository;
  });

  group('mypage', () {
    testWidgets('初期描画時にdummyUserの情報が画面に描画されること', (tester) async {
      when(repository.findById(id: 'umLDBXIjYX4EoGqtEwcI'))
          .thenAnswer((_) => Future.value(dummyUser));

      // Image.networkがUIにある場合はこれで包む
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(
            ProviderScope(
              // userRepositoryをmockでoverrideする
              overrides: [userRepositoryProvider.overrideWithValue(repository)],
              // この辺は描画に必要なものを適当に作成
              child: MaterialApp(
                title: 'MyPage Widget Test',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: const MyPage(),
              ),
            ),
          );
        },
      );

      // 描画が終わるまで待機する
      await tester.pumpAndSettle();

      // 表示するものがないのでとりあえずidを表示しておく
      expect(find.text(dummyUser.id), findsOneWidget);
    });
  });
}
