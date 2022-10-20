import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:cloud_functions/cloud_functions.dart';

final authRepositoryProvider = Provider<BaseAuthRepository>(
  (ref) => AuthRepository(
    logger: ref.read(loggerProvider),
  ),
);

final authStateProvider =
    StreamProvider((ref) => ref.watch(authRepositoryProvider).authStateChange);

abstract class BaseAuthRepository {
  Future<void> logIn({required String email, required String password});
  Future<void> signUp({
    required String email,
    required String password,
  });
  Future<String?> logInWithLine();
  String? getUid();
  Stream<User?> get authStateChange;
  Future<void> logOut();
  Future<void> deleteUser({required String password});
  Future<void> reAuth({required String password});
}

class AuthRepository implements BaseAuthRepository {
  final Logger _logger;
  final auth = FirebaseAuth.instance;
  final _lineSdk = LineSDK.instance;

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
      throw convertAuthError(e.code);
    }
  }

  @override
  Future<String?> logInWithLine() async {
    try {
      final result = await _lineSdk.login(scopes: ['profile', 'openid']);
      _logger.i(result.accessToken.idTokenRaw);
      final idToken = result.accessToken.idTokenRaw;
      final callable = FirebaseFunctions.instanceFor(region: 'asia-northeast1')
          .httpsCallable(
        'pushMessage',
      );
      await callable.call({'id_token': idToken});
      return idToken;
    } on PlatformException catch (e) {
      _logger.e(e);
      return null;
    }
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        // return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e.code);
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

  @override
  Future<void> deleteUser({required String password}) async {
    try {
      await reAuth(password: password);
      await auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e.code);
    }
  }

  @override
  Future<void> reAuth({required String password}) async {
    try {
      final AuthCredential authCredential = EmailAuthProvider.credential(
          email: auth.currentUser!.email!, password: password);
      auth.currentUser!.reauthenticateWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e.code);
    }
  }

  String convertAuthError(String errorCode) {
    switch (errorCode) {
      case "invalid-email":
        return "メールアドレスを正しい形式で入力して下さい";
      case "wrong-password":
        return "パスワードが間違っています";
      case "user-not-found":
        return "ユーザーが見つかりません";
      case "user-disabled":
        return "ユーザーが無効です";
      case "too-many-requests":
        return "しばらく待ってからお試し下さい";
      case "weak-password":
        return "パスワードは6文字以上で入力して下さい";
      case "email-already-in-use":
        return "このメールアドレスは既に登録されています";
      default:
        return "不明なエラーです";
    }
  }
}
