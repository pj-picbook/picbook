import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

abstract class BaseAuthRepository {
  Future logIn(String email, String password);
  Future signUp(String email, String password);
}

class AuthRepository implements BaseAuthRepository {
  final Reader _read;
  AuthRepository(this._read);
  final firebaseAuthService = FirebaseAuth.instance;

  @override
  Future logIn(String email, String password) async {
    try {
      await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ("Authentication ${e.toString()}");
    }
  }

  @override
  Future signUp(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuthService
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      print("Authentication ${e.toString()}");
    }
  }
}
