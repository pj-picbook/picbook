import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/common/dummy_data.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/presentation/mypage/mypage_notifier.dart';

import '../../mock/container.dart';
import '../../mock/user_repository_mock.dart';

void main() {
  late ProviderContainer container;
  late UserRepositoryMock repository;

  setUp(() {
    container = overrideUserRepository();
    repository = container.read(userRepository) as UserRepositoryMock;
    repository.reset();
  });

  group('fetch', () {
    test('存在するユーザーIDを渡した際に、正しくユーザー情報を取得できること', () async {
      // ユーザー情報をmockにセット
      repository.set(dummyUser);
      // containerからnotifierを呼び出し
      final notifier = container.read(myPageNotifierProvider.notifier);

      // テスト対象のメソッド実行
      await notifier.fetch(id: repository.nextId);
      final state = container.read(myPageNotifierProvider);

      expect(state, dummyUser);
    });
  });
}
