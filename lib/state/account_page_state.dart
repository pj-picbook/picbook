import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:picbook/domain/entity/user.dart';
import 'package:flutter/foundation.dart';

part 'account_page_state.freezed.dart';

@freezed
class AccountPageState with _$AccountPageState {
  const AccountPageState._();

  factory AccountPageState({
    required User user,
  }) = _AccountPageState;

  factory AccountPageState.initial() => AccountPageState(
        user: User.initial(),
      );
}
