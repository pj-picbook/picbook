import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebaseAuthService = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuthService
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      print("Authentication ${e.toString()}");
    }
  }

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
