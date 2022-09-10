import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login_form_state.freezed.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const LoginFormState._();

  factory LoginFormState({
    required String email,
    required String password,
  }) = _LoginFormState;
}
