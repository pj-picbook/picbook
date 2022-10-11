import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/state/reauth_form_state.dart';

final reAuthNotifierProvider = StateNotifierProvider.autoDispose((ref) {
  return ReAuthNotifier(authRepository: ref.read(authRepositoryProvider));
});

class ReAuthNotifier extends StateNotifier<ReAuthFormState> {
  final BaseAuthRepository _authRepository;
  ReAuthNotifier({required BaseAuthRepository authRepository})
      : _authRepository = authRepository,
        super(ReAuthFormState(password: ''));

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> delete() async {
    try {
      await _authRepository.deleteUser(password: state.password);
    } catch (e) {
      throw e.toString();
    }
  }
}
