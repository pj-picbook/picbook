import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'signup_form_state.freezed.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const SignUpFormState._();

  factory SignUpFormState({
    required String name,
    required DateTime birthday,
    required String email,
    required String password,
  }) = _SignUpFormState;
}
