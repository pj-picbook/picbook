import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/state/login_form_state.dart';

final signUpNotifierProvider = StateNotifierProvider(
  (ref) {
    return SignUpNotifier(authRepository: ref.read(authRepositoryProvider));
  },
);

class SignUpNotifier extends StateNotifier<LoginFormState> {
  final BaseAuthRepository _authRepository;
  SignUpNotifier({required BaseAuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginFormState(email: '', password: ''));

  void setEmail(String email) {
    state = state.copyWith(email: email, password: state.password);
  }

  void setPassword(String password) {
    state = state.copyWith(email: state.email, password: password);
  }

  Future<void> signUp() async {
    if (state.email.isEmpty) {
      throw "メールアドレスを入力してください";
    }
    if (state.password.isEmpty) {
      throw "パスワードを入力してください";
    }
    await _authRepository.signUp(email: state.email, password: state.password);
  }
}
