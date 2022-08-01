import 'dart:io';

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
    repository = container.read(userRepository) as MockUserRepository;
  });

  group('mypage', () {
    testWidgets('description', (tester) async {
      when(repository.findById(id: 'umLDBXIjYX4EoGqtEwcI'))
          .thenAnswer((_) => Future.value(dummyUser));
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [userRepository.overrideWithValue(mockUserRepository)],
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

      sleep(const Duration(seconds: 3));

      expect(find.text('なまえ'), findsOneWidget);
      expect(find.text('やまさん'), findsOneWidget);
    });
  });
}
