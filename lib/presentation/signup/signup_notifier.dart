import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/bookshelf.dart';
import 'package:picbook/domain/entity/user.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/bookshelf_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/state/signup_form_state.dart';

final signUpNotifierProvider = StateNotifierProvider(
  (ref) {
    return SignUpNotifier(
        authRepository: ref.read(authRepositoryProvider),
        userRepository: ref.read(userRepositoryProvider),
        bookshelfRepository: ref.read(bookshelfRepositoryProvider));
  },
);

class SignUpNotifier extends StateNotifier<SignUpFormState> {
  final BaseAuthRepository _authRepository;
  final UserRepository _userRepository;
  final BookshelfRepository _bookshelfRepository;

  SignUpNotifier(
      {required BaseAuthRepository authRepository,
      required UserRepository userRepository,
      required BookshelfRepository bookshelfRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        _bookshelfRepository = bookshelfRepository,
        super(
          SignUpFormState(
            name: '',
            birthday: DateTime.now(),
            email: '',
            password: '',
          ),
        );

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setBirthday(DateTime birthday) {
    state = state.copyWith(birthday: birthday);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> signUp() async {
    try {
      if (state.email.isEmpty) {
        throw "メールアドレスを入力してください";
      }
      if (state.password.isEmpty) {
        throw "パスワードを入力してください";
      }
      await _authRepository.signUp(
          email: state.email, password: state.password);
      final uid = _authRepository.getUid();

      await _userRepository.create(
        user:
            User(id: uid!, email: state.email, linkedAccount: 'linkedAccount'),
      );

      await _bookshelfRepository.create(
        uid: uid,
        bookshelf: Bookshelf(
          owner: state.name,
          ownerBirthday: state.birthday,
          created: DateTime.now(),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
