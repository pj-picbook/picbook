import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User(
      {@JsonKey(name: 'id')
          required String id,
      @JsonKey(name: 'name')
          required String name,
      @JsonKey(name: 'email')
          required String email,
      @JsonKey(name: 'linkedAccount')
          required String linkedAccount,
      @JsonKey(name: 'bookshelfs')
          required List<String> bookshelfs // Bookshelfsが無いので仮
      }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
