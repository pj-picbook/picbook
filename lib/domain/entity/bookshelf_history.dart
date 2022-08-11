import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:picbook/domain/entity/book.dart';

part 'bookshelf_history.freezed.dart';
part 'bookshelf_history.g.dart';

@freezed
class BookshelfHistory with _$BookshelfHistory {
  const BookshelfHistory._();

  factory BookshelfHistory(
      {@JsonKey(name: 'date') required DateTime date,
      @JsonKey(name: 'book') required Book book,
      s}) = _BookshelfHistory;

  factory BookshelfHistory.fromJson(Map<String, dynamic> json) =>
      _$BookshelfHistoryFromJson(json);
}
