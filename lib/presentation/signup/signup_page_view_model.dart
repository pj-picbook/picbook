import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/user.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/infrastructure/locator.dart';
import 'package:picbook/infrastructure/auth_repository.dart';

final SignUpPageProvier = ChangeNotifierProvider<SignUpPageViewModel>((ref) {
  return SignUpPageViewModel();
});

class SignUpPageViewModel extends ChangeNotifier {
  final AuthRepository _repository = getIt<AuthRepository>();
  Future<bool> signUp(String email, String password) async {
    var result = await _repository.signUp(email, password);
    if (result != User) {
      return false;
    }
    return true;
  }
}

// final signUpPageProvider =
//     StateNotifierProvider<SignUpPageNotifier, User>((ref) {
//   return SignUpPageNotifier(
//     userRepository: ref.read(userRepository),
//   );
// });
//
// class SignUpPageNotifier extends StateNotifier<User> {
//   final UserRepository _userRepository;
//   SignUpPageNotifier({required UserRepository userRepository})
//       : _userRepository = userRepository,
//         super(User.initial());
// }
