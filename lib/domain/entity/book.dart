import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

// MEMO: 楽天Apiを元に設計
@freezed
class Book with _$Book {
  const Book._();

  factory Book({
    @JsonKey(name: 'title') required String title,
    required String isbn,
    @Default('') String titleKana,
    @Default('') String subTitle,
    @Default('') String subTitleKana,
    @Default('') String seriesName,
    @Default('') String seriesNameKana,
    @Default('') String contents,
    @Default('') String contentsKana,
    @Default('') String author,
    @Default('') String authorKana,
    @Default('') String publisherName,
    @Default('') String size,
    @Default('') String itemCaption,
    @Default('') String salesDate,
    @Default('') String itemPrice,
    @Default('') String itemUrl,
    @Default('') String affiliateUrl,
    @Default('') String smallImageUrl,
    @Default('') String mediumImageUrl,
    @Default('') String largeImageUrl,
    @Default('') String chirayomiUrl,
    @Default('') String availability,
    @Default('') String postageFlag,
    @Default('') String limitedFlag,
    @Default('') String reviewCount,
    @Default('') String reviewAverage,
    @Default('') String booksGenreId,
  }) = _Book;
}
