// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookshelfHistory _$$_BookshelfHistoryFromJson(Map<String, dynamic> json) =>
    _$_BookshelfHistory(
      date: const DateTimeConverter().fromJson(json['date'] as String),
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookshelfHistoryToJson(_$_BookshelfHistory instance) =>
    <String, dynamic>{
      'date': const DateTimeConverter().toJson(instance.date),
      'book': instance.book,
    };
