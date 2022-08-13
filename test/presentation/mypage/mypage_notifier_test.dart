import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/common/dummy_data.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/bookshelf_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/presentation/mypage/mypage_notifier.dart';
import 'package:mockito/mockito.dart';

import '../../mock/container.dart';
import '../../mock/container.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockUserRepository userRepository;
  late MockAuthRepository authRepository;
  late MockBookshelfRepository bookshelfRepository;

  setUp(() {
    container = overrideUserRepository();
    userRepository =
        container.read(userRepositoryProvider) as MockUserRepository;
    authRepository =
        container.read(authRepositoryProvider) as MockAuthRepository;
    bookshelfRepository =
        container.read(bookshelfRepositoryProvider) as MockBookshelfRepository;
  });

  group('fetch', () {
    test('存在するユーザーIDを渡した際に、正しくユーザー情報を取得できること', () async {
      // ユーザー情報をmockにセット
      when(authRepository.getUid()).thenAnswer((_) => 'test_uid');
      when(userRepository.findById(id: 'test_uid'))
          .thenAnswer((_) => Future.value(dummyUser));
      when(bookshelfRepository.fetchAll(uid: 'test_uid'))
          .thenAnswer((realInvocation) => Future.value([dummyBookshelf]));

      // containerからnotifierを呼び出し
      final notifier = container.read(myPageNotifierProvider.notifier);

      // テスト対象のメソッド実行
      await notifier.fetch();
      final state = container.read(myPageNotifierProvider);

      expect(state.user, dummyUser);
      expect(state.currentBookshelf, dummyBookshelf);
    });
  });
}
