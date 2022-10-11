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

///
class AccountPageNotifier extends StateNotifier<AccountState> {
  final BaseAuthRepository _authRepository;

  final logger = Logger();
  AccountPageNotifier({
    required Logger logger,
    required BaseAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(AccountState());

  void fetch() async {
    final email = _authRepository.getEmail();
    state = state.copyWith(email: email!);
  }
}
