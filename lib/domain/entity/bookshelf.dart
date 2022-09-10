import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/date_time_converter.dart';
import 'book.dart';
import 'bookshelf_history.dart';

part 'bookshelf.freezed.dart';
part 'bookshelf.g.dart';

@freezed
class Bookshelf with _$Bookshelf {
  const Bookshelf._();

  factory Bookshelf({
    @Default("") @JsonKey(name: 'id') String id,
    @JsonKey(name: 'owner') required String owner,
    @DateTimeConverter()
    @JsonKey(name: 'ownerBirthday')
        required DateTime ownerBirthday,
    @Default([]) @JsonKey(name: 'books') List<Book> books,
    @Default([])
    @JsonKey(name: 'readHistories')
        List<BookshelfHistory> readHistories,
    @DateTimeConverter() @JsonKey(name: 'created') required DateTime created,
  }) = _Bookshelf;

  factory Bookshelf.fromJson(Map<String, dynamic> json) =>
      _$BookshelfFromJson(json);
}
