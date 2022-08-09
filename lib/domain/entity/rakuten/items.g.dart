// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Items _$$_ItemsFromJson(Map<String, dynamic> json) => _$_Items(
      items: (json['Items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
      page: json['page'] as int,
      first: json['first'] as int,
      last: json['last'] as int,
      hits: json['hits'] as int,
      carrier: json['carrier'] as int,
      pageCount: json['pageCount'] as int,
    );

Map<String, dynamic> _$$_ItemsToJson(_$_Items instance) => <String, dynamic>{
      'Items': instance.items,
      'count': instance.count,
      'page': instance.page,
      'first': instance.first,
      'last': instance.last,
      'hits': instance.hits,
      'carrier': instance.carrier,
      'pageCount': instance.pageCount,
    };
