import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:picbook/common/timstamp_converter.dart';

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
    @TimestampConverter()
    @JsonKey(name: 'registeredDateTime')
        DateTime? registeredDateTime,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  factory Book.initial() => Book();
}
