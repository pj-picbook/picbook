import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const AccountState._();

  factory AccountState({
    @Default("") String email,
  }) = _AccountState;
}
