import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final inputProvider = StateNotifierProvider((ref) {
  return InputNotifier();
});

@immutable
class UserInputState {
  const UserInputState({required this.userInfo});
  final String userInfo;

  UserInputState copyWith({String? userInfo}) {
    return UserInputState(userInfo: userInfo ?? this.userInfo);
  }
}

class InputNotifier extends StateNotifier {
  InputNotifier() : super([]);

  final AuthRepository _repository = getIt<AuthRepository>();
  Future<bool> signUp(String email, String password) async {
    var result = await _repository.signUp(email, password);
    if (result != User) {
      return false;
    }
    return true;
  }
}
