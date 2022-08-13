import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/common/logger_provider.dart';

final authRepositoryProvider = Provider<BaseAuthRepository>(
  (ref) => AuthRepository(
    logger: ref.read(loggerProvider),
  ),
);

final authStateProvider =
    StreamProvider((ref) => ref.watch(authRepositoryProvider).authStateChange);

abstract class BaseAuthRepository {
  Future<void> logIn({required String email, required String password});
  Future<void> signUp({required String email, required String password});
  String? getUid();
  Stream<User?> get authStateChange;
  Future<void> logOut();
}

class AuthRepository implements BaseAuthRepository {
  final Logger _logger;
  final auth = FirebaseAuth.instance;

  AuthRepository({required Logger logger}) : _logger = logger;

  @override
  Stream<User?> get authStateChange => auth.authStateChanges();

  @override
  String? getUid() {
    if (auth.currentUser == null) {
      return null;
    } else {
      return auth.currentUser!.uid;
    }
  }

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

  @override
  Future<void> logOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      _logger.e(e);
    }
  }
}
