// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bookshelf_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookshelfHistory _$BookshelfHistoryFromJson(Map<String, dynamic> json) {
  return _BookshelfHistory.fromJson(json);
}

/// @nodoc
mixin _$BookshelfHistory {
  @JsonKey(name: 'date')
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'book')
  Book get book => throw _privateConstructorUsedError;
  dynamic get s => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookshelfHistoryCopyWith<BookshelfHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookshelfHistoryCopyWith<$Res> {
  factory $BookshelfHistoryCopyWith(
          BookshelfHistory value, $Res Function(BookshelfHistory) then) =
      _$BookshelfHistoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'date') DateTime date,
      @JsonKey(name: 'book') Book book,
      dynamic s});

  $BookCopyWith<$Res> get book;
}

/// @nodoc
class _$BookshelfHistoryCopyWithImpl<$Res>
    implements $BookshelfHistoryCopyWith<$Res> {
  _$BookshelfHistoryCopyWithImpl(this._value, this._then);

  final BookshelfHistory _value;
  // ignore: unused_field
  final $Res Function(BookshelfHistory) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? book = freezed,
    Object? s = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      s: s == freezed
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  $BookCopyWith<$Res> get book {
    return $BookCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value));
    });
  }
}

/// @nodoc
abstract class _$$_BookshelfHistoryCopyWith<$Res>
    implements $BookshelfHistoryCopyWith<$Res> {
  factory _$$_BookshelfHistoryCopyWith(
          _$_BookshelfHistory value, $Res Function(_$_BookshelfHistory) then) =
      __$$_BookshelfHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'date') DateTime date,
      @JsonKey(name: 'book') Book book,
      dynamic s});

  @override
  $BookCopyWith<$Res> get book;
}

/// @nodoc
class __$$_BookshelfHistoryCopyWithImpl<$Res>
    extends _$BookshelfHistoryCopyWithImpl<$Res>
    implements _$$_BookshelfHistoryCopyWith<$Res> {
  __$$_BookshelfHistoryCopyWithImpl(
      _$_BookshelfHistory _value, $Res Function(_$_BookshelfHistory) _then)
      : super(_value, (v) => _then(v as _$_BookshelfHistory));

  @override
  _$_BookshelfHistory get _value => super._value as _$_BookshelfHistory;

  @override
  $Res call({
    Object? date = freezed,
    Object? book = freezed,
    Object? s = freezed,
  }) {
    return _then(_$_BookshelfHistory(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      s: s == freezed ? _value.s : s,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookshelfHistory extends _BookshelfHistory
    with DiagnosticableTreeMixin {
  _$_BookshelfHistory(
      {@JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'book') required this.book,
      this.s})
      : super._();

  factory _$_BookshelfHistory.fromJson(Map<String, dynamic> json) =>
      _$$_BookshelfHistoryFromJson(json);

  @override
  @JsonKey(name: 'date')
  final DateTime date;
  @override
  @JsonKey(name: 'book')
  final Book book;
  @override
  final dynamic s;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookshelfHistory(date: $date, book: $book, s: $s)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookshelfHistory'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('book', book))
      ..add(DiagnosticsProperty('s', s));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookshelfHistory &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.book, book) &&
            const DeepCollectionEquality().equals(other.s, s));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(book),
      const DeepCollectionEquality().hash(s));

  @JsonKey(ignore: true)
  @override
  _$$_BookshelfHistoryCopyWith<_$_BookshelfHistory> get copyWith =>
      __$$_BookshelfHistoryCopyWithImpl<_$_BookshelfHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookshelfHistoryToJson(
      this,
    );
  }
}

abstract class _BookshelfHistory extends BookshelfHistory {
  factory _BookshelfHistory(
      {@JsonKey(name: 'date') required final DateTime date,
      @JsonKey(name: 'book') required final Book book,
      final dynamic s}) = _$_BookshelfHistory;
  _BookshelfHistory._() : super._();

  factory _BookshelfHistory.fromJson(Map<String, dynamic> json) =
      _$_BookshelfHistory.fromJson;

  @override
  @JsonKey(name: 'date')
  DateTime get date;
  @override
  @JsonKey(name: 'book')
  Book get book;
  @override
  dynamic get s;
  @override
  @JsonKey(ignore: true)
  _$$_BookshelfHistoryCopyWith<_$_BookshelfHistory> get copyWith =>
      throw _privateConstructorUsedError;
}