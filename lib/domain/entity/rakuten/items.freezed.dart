// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return _Items.fromJson(json);
}

/// @nodoc
mixin _$Items {
  @JsonKey(name: 'Items')
  List<Item> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'first')
  int get first => throw _privateConstructorUsedError;
  @JsonKey(name: 'last')
  int get last => throw _privateConstructorUsedError;
  @JsonKey(name: 'hits')
  int get hits => throw _privateConstructorUsedError;
  @JsonKey(name: 'carrier')
  int get carrier => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageCount')
  int get pageCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemsCopyWith<Items> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsCopyWith<$Res> {
  factory $ItemsCopyWith(Items value, $Res Function(Items) then) =
      _$ItemsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Items') List<Item> items,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'first') int first,
      @JsonKey(name: 'last') int last,
      @JsonKey(name: 'hits') int hits,
      @JsonKey(name: 'carrier') int carrier,
      @JsonKey(name: 'pageCount') int pageCount});
}

/// @nodoc
class _$ItemsCopyWithImpl<$Res> implements $ItemsCopyWith<$Res> {
  _$ItemsCopyWithImpl(this._value, this._then);

  final Items _value;
  // ignore: unused_field
  final $Res Function(Items) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? count = freezed,
    Object? page = freezed,
    Object? first = freezed,
    Object? last = freezed,
    Object? hits = freezed,
    Object? carrier = freezed,
    Object? pageCount = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      hits: hits == freezed
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as int,
      carrier: carrier == freezed
          ? _value.carrier
          : carrier // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: pageCount == freezed
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemsCopyWith<$Res> implements $ItemsCopyWith<$Res> {
  factory _$$_ItemsCopyWith(_$_Items value, $Res Function(_$_Items) then) =
      __$$_ItemsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Items') List<Item> items,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'first') int first,
      @JsonKey(name: 'last') int last,
      @JsonKey(name: 'hits') int hits,
      @JsonKey(name: 'carrier') int carrier,
      @JsonKey(name: 'pageCount') int pageCount});
}

/// @nodoc
class __$$_ItemsCopyWithImpl<$Res> extends _$ItemsCopyWithImpl<$Res>
    implements _$$_ItemsCopyWith<$Res> {
  __$$_ItemsCopyWithImpl(_$_Items _value, $Res Function(_$_Items) _then)
      : super(_value, (v) => _then(v as _$_Items));

  @override
  _$_Items get _value => super._value as _$_Items;

  @override
  $Res call({
    Object? items = freezed,
    Object? count = freezed,
    Object? page = freezed,
    Object? first = freezed,
    Object? last = freezed,
    Object? hits = freezed,
    Object? carrier = freezed,
    Object? pageCount = freezed,
  }) {
    return _then(_$_Items(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      hits: hits == freezed
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as int,
      carrier: carrier == freezed
          ? _value.carrier
          : carrier // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: pageCount == freezed
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Items extends _Items with DiagnosticableTreeMixin {
  _$_Items(
      {@JsonKey(name: 'Items') required final List<Item> items,
      @JsonKey(name: 'count') required this.count,
      @JsonKey(name: 'page') required this.page,
      @JsonKey(name: 'first') required this.first,
      @JsonKey(name: 'last') required this.last,
      @JsonKey(name: 'hits') required this.hits,
      @JsonKey(name: 'carrier') required this.carrier,
      @JsonKey(name: 'pageCount') required this.pageCount})
      : _items = items,
        super._();

  factory _$_Items.fromJson(Map<String, dynamic> json) =>
      _$$_ItemsFromJson(json);

  final List<Item> _items;
  @override
  @JsonKey(name: 'Items')
  List<Item> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'count')
  final int count;
  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'first')
  final int first;
  @override
  @JsonKey(name: 'last')
  final int last;
  @override
  @JsonKey(name: 'hits')
  final int hits;
  @override
  @JsonKey(name: 'carrier')
  final int carrier;
  @override
  @JsonKey(name: 'pageCount')
  final int pageCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Items(items: $items, count: $count, page: $page, first: $first, last: $last, hits: $hits, carrier: $carrier, pageCount: $pageCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Items'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('first', first))
      ..add(DiagnosticsProperty('last', last))
      ..add(DiagnosticsProperty('hits', hits))
      ..add(DiagnosticsProperty('carrier', carrier))
      ..add(DiagnosticsProperty('pageCount', pageCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Items &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.first, first) &&
            const DeepCollectionEquality().equals(other.last, last) &&
            const DeepCollectionEquality().equals(other.hits, hits) &&
            const DeepCollectionEquality().equals(other.carrier, carrier) &&
            const DeepCollectionEquality().equals(other.pageCount, pageCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(first),
      const DeepCollectionEquality().hash(last),
      const DeepCollectionEquality().hash(hits),
      const DeepCollectionEquality().hash(carrier),
      const DeepCollectionEquality().hash(pageCount));

  @JsonKey(ignore: true)
  @override
  _$$_ItemsCopyWith<_$_Items> get copyWith =>
      __$$_ItemsCopyWithImpl<_$_Items>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemsToJson(
      this,
    );
  }
}

abstract class _Items extends Items {
  factory _Items(
      {@JsonKey(name: 'Items') required final List<Item> items,
      @JsonKey(name: 'count') required final int count,
      @JsonKey(name: 'page') required final int page,
      @JsonKey(name: 'first') required final int first,
      @JsonKey(name: 'last') required final int last,
      @JsonKey(name: 'hits') required final int hits,
      @JsonKey(name: 'carrier') required final int carrier,
      @JsonKey(name: 'pageCount') required final int pageCount}) = _$_Items;
  _Items._() : super._();

  factory _Items.fromJson(Map<String, dynamic> json) = _$_Items.fromJson;

  @override
  @JsonKey(name: 'Items')
  List<Item> get items;
  @override
  @JsonKey(name: 'count')
  int get count;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'first')
  int get first;
  @override
  @JsonKey(name: 'last')
  int get last;
  @override
  @JsonKey(name: 'hits')
  int get hits;
  @override
  @JsonKey(name: 'carrier')
  int get carrier;
  @override
  @JsonKey(name: 'pageCount')
  int get pageCount;
  @override
  @JsonKey(ignore: true)
  _$$_ItemsCopyWith<_$_Items> get copyWith =>
      throw _privateConstructorUsedError;
}
