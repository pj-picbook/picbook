// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bookshelf _$$_BookshelfFromJson(Map<String, dynamic> json) => _$_Bookshelf(
      id: json['id'] as String? ?? "",
      owner: json['owner'] as String,
      ownerBirthday:
          const DateTimeConverter().fromJson(json['ownerBirthday'] as String),
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      readHistories: (json['readHistories'] as List<dynamic>?)
              ?.map((e) => BookshelfHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      created: const DateTimeConverter().fromJson(json['created'] as String),
    );

Map<String, dynamic> _$$_BookshelfToJson(_$_Bookshelf instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'ownerBirthday': const DateTimeConverter().toJson(instance.ownerBirthday),
      'books': instance.books,
      'readHistories': instance.readHistories,
      'created': const DateTimeConverter().toJson(instance.created),
    };
