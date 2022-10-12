import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/presentation/account_page/account_state.dart';

final accountPageNotifierProvider =
    StateNotifierProvider<AccountPageNotifier, AccountState>((ref) {
  return AccountPageNotifier(
    logger: ref.read(loggerProvider),
    authRepository: ref.read(authRepositoryProvider),
  );
});

class AccountPageNotifier extends StateNotifier<AccountState> {
  final BaseAuthRepository _authRepository;
  final Logger _logger;

  AccountPageNotifier({
    required Logger logger,
    required BaseAuthRepository authRepository,
  })  : _authRepository = authRepository,
        _logger = logger,
        super(AccountState());

  void fetch() {
    final email = _authRepository.getEmail();
    _logger.i('user email=$email');
    state = state.copyWith(email: email!);
  }
}
