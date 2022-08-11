import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/state/login_form_state.dart';

final loginNotifierProvider = StateNotifierProvider(
  (ref) {
    return LoginNotifier(authRepository: ref.read(authRepositoryProvider));
  },
);

class LoginNotifier extends StateNotifier<LoginFormState> {
  final BaseAuthRepository _authRepository;
  LoginNotifier({required BaseAuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginFormState(email: '', password: ''));

  void setEmail(String email) {
    state = state.copyWith(email: email, password: state.password);
  }

  void setPassword(String password) {
    state = state.copyWith(email: state.email, password: password);
  }

  Future<void> logIn() async {
    if (state.email.isEmpty) {
      throw "メールアドレスを入力してください";
    }
    if (state.password.isEmpty) {
      throw "パスワードを入力してください";
    }
    try {
      await _authRepository.logIn(email: state.email, password: state.password);
    } catch (e) {
      throw e.toString();
    }
  }
}
