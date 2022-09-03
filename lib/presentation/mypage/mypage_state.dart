import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:picbook/domain/entity/book.dart';
import 'package:picbook/domain/entity/bookshelf.dart';
import 'package:picbook/domain/entity/user.dart';

part 'mypage_state.freezed.dart';

@freezed
class MyPageState with _$MyPageState {
  const MyPageState._();

  factory MyPageState({
    required User user,
    required Bookshelf currentBookshelf,
    required List<Book>? books,
  }) = _MyPageState;

  factory MyPageState.initial() => MyPageState(
        user: User.initial(),
        currentBookshelf: Bookshelf(
          owner: '',
          ownerBirthday: DateTime.now(),
          created: DateTime.now(),
        ),
        books: [],
      );
}
