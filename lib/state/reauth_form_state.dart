import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'reauth_form_state.freezed.dart';

@freezed
class ReAuthFormState with _$ReAuthFormState {
  const ReAuthFormState._();

  factory ReAuthFormState({
    required String password,
  }) = _ReAuthFormState;
}
