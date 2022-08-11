// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bookshelf _$$_BookshelfFromJson(Map<String, dynamic> json) => _$_Bookshelf(
      date: json['id'] as String,
      book: json['owner'] as String,
      ownerBirthday: DateTime.parse(json['ownerBirthday'] as String),
      books: (json['books'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      readHistories: BookshelfHistory.fromJson(
          json['readHistories'] as Map<String, dynamic>),
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$_BookshelfToJson(_$_Bookshelf instance) =>
    <String, dynamic>{
      'id': instance.date,
      'owner': instance.book,
      'ownerBirthday': instance.ownerBirthday.toIso8601String(),
      'books': instance.books,
      'readHistories': instance.readHistories,
      'created': instance.created.toIso8601String(),
    };
