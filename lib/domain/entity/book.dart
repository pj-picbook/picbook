import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

// MEMO: 楽天Apiを元に設計
@freezed
class Book with _$Book {
  const Book._();

  factory Book({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'isbn') String? isbn,
    @JsonKey(name: 'titleKana') String? titleKana,
    @JsonKey(name: 'subTitle') String? subTitle,
    @JsonKey(name: 'subTitleKana') String? subTitleKana,
    @JsonKey(name: 'seriesName') String? seriesName,
    @JsonKey(name: 'seriesNameKana') String? seriesNameKana,
    @JsonKey(name: 'contents') String? contents,
    @JsonKey(name: 'contentsKana') String? contentsKana,
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'authorKana') String? authorKana,
    @JsonKey(name: 'publisherName') String? publisherName,
    @JsonKey(name: 'size') String? size,
    @JsonKey(name: 'itemCaption') String? itemCaption,
    @JsonKey(name: 'salesDate') String? salesDate,
    @JsonKey(name: 'itemPrice') int? itemPrice,
    @JsonKey(name: 'itemUrl') String? itemUrl,
    @JsonKey(name: 'affiliateUrl') String? affiliateUrl,
    @JsonKey(name: 'smallImageUrl') String? smallImageUrl,
    @JsonKey(name: 'mediumImageUrl') String? mediumImageUrl,
    @JsonKey(name: 'largeImageUrl') String? largeImageUrl,
    @JsonKey(name: 'chirayomiUrl') String? chirayomiUrl,
    @JsonKey(name: 'availability') String? availability,
    @JsonKey(name: 'postageFlag') int? postageFlag,
    @JsonKey(name: 'limitedFlag') int? limitedFlag,
    @JsonKey(name: 'reviewCount') int? reviewCount,
    @JsonKey(name: 'reviewAverage') String? reviewAverage,
    @JsonKey(name: 'booksGenreId') String? booksGenreId,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
