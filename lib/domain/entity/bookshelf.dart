import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'book.dart';
import 'bookshelf_history.dart';

part 'bookshelf.freezed.dart';
part 'bookshelf.g.dart';

@freezed
class Bookshelf with _$Bookshelf {
  const Bookshelf._();

  factory Bookshelf({
    @JsonKey(name: 'id') required String date,
    @JsonKey(name: 'owner') required String book,
    @JsonKey(name: 'ownerBirthday') required DateTime ownerBirthday,
    @JsonKey(name: 'books') required List<Book> books,
    @JsonKey(name: 'readHistories') required BookshelfHistory readHistories,
    @JsonKey(name: 'created') required DateTime created,
  }) = _Bookshelf;

  factory Bookshelf.fromJson(Map<String, dynamic> json) =>
      _$BookshelfFromJson(json);
}
