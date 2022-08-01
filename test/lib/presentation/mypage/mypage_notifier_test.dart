import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/common/dummy_data.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/presentation/mypage/mypage_notifier.dart';
import 'package:mockito/mockito.dart';

import '../../mock/container.dart';
import '../../mock/container.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockUserRepository repository;

  setUp(() {
    container = overrideUserRepository();
    repository = container.read(userRepository) as MockUserRepository;
  });

  group('fetch', () {
    test('存在するユーザーIDを渡した際に、正しくユーザー情報を取得できること', () async {
      // ユーザー情報をmockにセット
      when(repository.findById(id: 'test'))
          .thenAnswer((_) => Future.value(dummyUser));

      // containerからnotifierを呼び出し
      final notifier = container.read(myPageNotifierProvider.notifier);

      // テスト対象のメソッド実行
      await notifier.fetch(id: 'test');
      final state = container.read(myPageNotifierProvider);

      expect(state, dummyUser);
    });
  });
}
