import 'package:flutter/material.dart';

@immutable
class UserInputState {
  const UserInputState({required this.userInfo});
  final Object userInfo;

  UserInputState copyWith({Object? userInfo}) {
    return UserInputState(userInfo: userInfo ?? this.userInfo);
  }
}
