import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entity/book.dart';
import '../domain/entity/rakuten/items.dart';

part 'search_book_state.freezed.dart';

@freezed
class SearchBookState with _$SearchBookState {
  const SearchBookState._();

  factory SearchBookState({
    required Items items,
    required List<Book> books,
  }) = _SearchBookState;
}
