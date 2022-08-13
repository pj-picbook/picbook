import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/user.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/state/login_form_state.dart';

final signUpNotifierProvider = StateNotifierProvider(
  (ref) {
    return SignUpNotifier(
      authRepository: ref.read(authRepositoryProvider),
      userRepository: ref.read(userRepository),
    );
  },
);

class SignUpNotifier extends StateNotifier<LoginFormState> {
  final BaseAuthRepository _authRepository;
  final UserRepository _userRepository;

  SignUpNotifier(
      {required BaseAuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
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
    final uid = _authRepository.getUid();

    await _userRepository.create(
      user: User(id: uid!, email: state.email, linkedAccount: 'linkedAccount'),
    );
  }
}
