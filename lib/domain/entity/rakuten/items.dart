import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'item.dart';

part 'items.freezed.dart';
part 'items.g.dart';

@freezed
class Items with _$Items {
  const Items._();

  factory Items({
    @JsonKey(name: 'Items') required List<Item> items,
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'first') required int first,
    @JsonKey(name: 'last') required int last,
    @JsonKey(name: 'hits') required int hits,
    @JsonKey(name: 'carrier') required int carrier,
    @JsonKey(name: 'pageCount') required int pageCount,
  }) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  factory Items.dummy() => Items(
        items: [],
        count: 0,
        page: 0,
        first: 0,
        last: 0,
        hits: 0,
        carrier: 0,
        pageCount: 0,
      );
}
