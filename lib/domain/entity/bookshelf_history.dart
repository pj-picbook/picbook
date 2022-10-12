import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:picbook/common/timstamp_converter.dart';
import 'package:picbook/domain/entity/book.dart';
import 'package:picbook/common/date_time_converter.dart';
part 'bookshelf_history.freezed.dart';
part 'bookshelf_history.g.dart';

@freezed
class BookshelfHistory with _$BookshelfHistory {
  const BookshelfHistory._();

  factory BookshelfHistory({
    @DateTimeConverter() @JsonKey(name: 'date') required DateTime date,
    @JsonKey(name: 'book') required Book book,
  }) = _BookshelfHistory;

  factory BookshelfHistory.fromJson(Map<String, dynamic> json) =>
      _$BookshelfHistoryFromJson(json);
}
