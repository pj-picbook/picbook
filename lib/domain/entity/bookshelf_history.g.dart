// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookshelfHistory _$$_BookshelfHistoryFromJson(Map<String, dynamic> json) =>
    _$_BookshelfHistory(
      date: DateTime.parse(json['date'] as String),
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      s: json['s'],
    );

Map<String, dynamic> _$$_BookshelfHistoryToJson(_$_BookshelfHistory instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'book': instance.book,
      's': instance.s,
    };
