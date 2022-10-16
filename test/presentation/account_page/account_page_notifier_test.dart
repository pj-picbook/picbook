import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/presentation/account_page/account_page_notifier.dart';
import 'package:mockito/mockito.dart';

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

  group('fetch', () {
    test('authRepositoryからemailを取得し、stateが更新されること', () async {
      // ユーザー情報をmockにセット
      when(authRepository.getEmail())
          .thenAnswer((_) => 'test_email@example.com');

      // containerからnotifierを呼び出し
      final notifier = container.read(accountPageNotifierProvider.notifier);

      // テスト対象のメソッド実行
      notifier.fetch();
      final state = container.read(accountPageNotifierProvider);

      // stateに想定の情報が入っていることを検査
      expect(state.email, 'test_email@example.com');

      // 各メソッドの呼ばれた回数を検査
      verify(authRepository.getEmail()).called(1);
      verify(mockLogger.i(any)).called(1);
    });
  });
}
