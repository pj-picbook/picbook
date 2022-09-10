import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/state/account_page_state.dart';

final accountPageNotifierProvider =
    StateNotifierProvider<AccountPageNotifier, AccountPageState>((ref) {
  return AccountPageNotifier(
      logger: ref.read(loggerProvider),
      authRepository: ref.read(authRepositoryProvider),
      userRepository: ref.read(userRepositoryProvider));
});

class AccountPageNotifier extends StateNotifier<AccountPageState> {
  final BaseAuthRepository _authRepository;

  final logger = Logger();
  AccountPageNotifier({
    required Logger logger,
    required BaseAuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        super(AccountPageState.initial());

  Future<void> deleteUser() async {
    try {
      _authRepository.deleteUser();
    } catch (e) {
      logger.e(e);
    }
  }
}
