import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/common/dummy_data.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/bookshelf_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/presentation/mypage/mypage_notifier.dart';
import 'package:mockito/mockito.dart';

import '../../mock/container.dart';
import '../../mock/container.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockLogger mockLogger;
  late MockUserRepository userRepository;
  late MockAuthRepository authRepository;
  late MockBookshelfRepository bookshelfRepository;

  setUp(() {
    container = overrideUserRepository();
    mockLogger = container.read(loggerProvider) as MockLogger;
    userRepository =
        container.read(userRepositoryProvider) as MockUserRepository;
    authRepository =
        container.read(authRepositoryProvider) as MockAuthRepository;
    bookshelfRepository =
        container.read(bookshelfRepositoryProvider) as MockBookshelfRepository;
  });

  group('fetch', () {
    test('uidを取得し、userReoisitoryとbookshelfRepositoryから対象の情報を取得してstateを更新する',
        () async {
      // ユーザー情報をmockにセット
      when(authRepository.getUid()).thenAnswer((_) => 'test_uid');
      when(userRepository.findById(id: 'test_uid'))
          .thenAnswer((_) => Future.value(dummyUser));
      when(bookshelfRepository.fetchAll(uid: 'test_uid'))
          .thenAnswer((_) => Future.value([dummyBookshelf]));

      // containerからnotifierを呼び出し
      final notifier = container.read(myPageNotifierProvider.notifier);

      // テスト対象のメソッド実行
      await notifier.fetch();
      final state = container.read(myPageNotifierProvider);

      // stateに想定の情報が入っていることを検査
      expect(state.user, dummyUser);
      expect(state.currentBookshelf, dummyBookshelf);

      // 各メソッドの呼ばれた回数を検査
      verify(authRepository.getUid()).called(1);
      verify(userRepository.findById(id: 'test_uid')).called(1);
      verify(bookshelfRepository.fetchAll(uid: 'test_uid')).called(1);
    });
  });

  group('logout', () {
    test('logoutが正常に行われる場合、エラーログが出力されないこと', () async {
      // logoutのみ返却値を定義
      when(authRepository.logOut()).thenAnswer((_) => Future.value(null));

      // containerからnotifierを呼び出し
      final notifier = container.read(myPageNotifierProvider.notifier);

      // テスト対象のメソッド実行
      await notifier.logOut();

      // エラーログが呼び出されていないことを検査
      verifyNever(mockLogger.e(any));
    });
  });
}
