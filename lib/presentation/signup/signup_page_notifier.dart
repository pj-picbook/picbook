import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/user.dart';
import 'package:picbook/infrastructure/user_repository.dart';

final signUpPageProvider =
    StateNotifierProvider<SignUpPageNotifier, User>((ref) {
  return SignUpPageNotifier(
    userRepository: ref.read(userRepository),
  );
});

class SignUpPageNotifier extends StateNotifier<User> {
  final UserRepository _userRepository;
  SignUpPageNotifier({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(User.initial());
}
