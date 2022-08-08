import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebaseAuthService = FirebaseAuth.instance;

  Future signUp(String email, String password) async {
    try {
      UserCredential _userCredential = await firebaseAuthService
          .createUserWithEmailAndPassword(email: email, password: password);
      if (_userCredential.user != null) {
        return _userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      print("Authentication ${e.toString()}");
    }
  }
}
