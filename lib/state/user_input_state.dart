import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/auth_repository.dart';

final inputProvider = StateNotifierProvider((ref) {
  return InputNotifier(ref.read);
});

class InputNotifier extends StateNotifier<User?> {
  final Reader _read;
  InputNotifier(this._read) : super(null);

  Future<void> logIn(String email, String password) async {
    try {
      await _read(authRepositoryProvider).logIn(email, password);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signUp(String email, String password) async {
    await _read(authRepositoryProvider).signUp(email, password);
  }
}
