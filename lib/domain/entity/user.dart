import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  factory User(
      {required String id,
      required String name,
      required String email,
      required String linkedAccount,
      required List<String> bookshelfs // Bookshelfsが無いので仮
      }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
