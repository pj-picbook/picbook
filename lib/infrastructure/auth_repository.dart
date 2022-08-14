import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/common/logger_provider.dart';

final authRepositoryProvider = Provider<BaseAuthRepository>(
  (ref) => AuthRepository(
    logger: ref.read(loggerProvider),
  ),
);

abstract class BaseAuthRepository {
  Future<void> logIn({required String email, required String password});
  Future<void> signUp({required String email, required String password});
}

class AuthRepository implements BaseAuthRepository {
  final Logger _logger;
  final auth = FirebaseAuth.instance;

  AuthRepository({required Logger logger}) : _logger = logger;

  @override
  Future<void> logIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ("Authentication ${e.toString()}");
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        // return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      _logger.e("Authentication ${e.toString()}");
    }
  }
}
