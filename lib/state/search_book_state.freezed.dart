// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchBookState {
  Items get items => throw _privateConstructorUsedError;
  List<Book> get books => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchBookStateCopyWith<SearchBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBookStateCopyWith<$Res> {
  factory $SearchBookStateCopyWith(
          SearchBookState value, $Res Function(SearchBookState) then) =
      _$SearchBookStateCopyWithImpl<$Res>;
  $Res call({Items items, List<Book> books});

  $ItemsCopyWith<$Res> get items;
}

/// @nodoc
class _$SearchBookStateCopyWithImpl<$Res>
    implements $SearchBookStateCopyWith<$Res> {
  _$SearchBookStateCopyWithImpl(this._value, this._then);

  final SearchBookState _value;
  // ignore: unused_field
  final $Res Function(SearchBookState) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? books = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Items,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }

  @override
  $ItemsCopyWith<$Res> get items {
    return $ItemsCopyWith<$Res>(_value.items, (value) {
      return _then(_value.copyWith(items: value));
    });
  }
}

/// @nodoc
abstract class _$$_SearchBookStateCopyWith<$Res>
    implements $SearchBookStateCopyWith<$Res> {
  factory _$$_SearchBookStateCopyWith(
          _$_SearchBookState value, $Res Function(_$_SearchBookState) then) =
      __$$_SearchBookStateCopyWithImpl<$Res>;
  @override
  $Res call({Items items, List<Book> books});

  @override
  $ItemsCopyWith<$Res> get items;
}

/// @nodoc
class __$$_SearchBookStateCopyWithImpl<$Res>
    extends _$SearchBookStateCopyWithImpl<$Res>
    implements _$$_SearchBookStateCopyWith<$Res> {
  __$$_SearchBookStateCopyWithImpl(
      _$_SearchBookState _value, $Res Function(_$_SearchBookState) _then)
      : super(_value, (v) => _then(v as _$_SearchBookState));

  @override
  _$_SearchBookState get _value => super._value as _$_SearchBookState;

  @override
  $Res call({
    Object? items = freezed,
    Object? books = freezed,
  }) {
    return _then(_$_SearchBookState(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Items,
      books: books == freezed
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$_SearchBookState extends _SearchBookState with DiagnosticableTreeMixin {
  _$_SearchBookState({required this.items, required final List<Book> books})
      : _books = books,
        super._();

  @override
  final Items items;
  final List<Book> _books;
  @override
  List<Book> get books {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchBookState(items: $items, books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchBookState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchBookState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  _$$_SearchBookStateCopyWith<_$_SearchBookState> get copyWith =>
      __$$_SearchBookStateCopyWithImpl<_$_SearchBookState>(this, _$identity);
}

abstract class _SearchBookState extends SearchBookState {
  factory _SearchBookState(
      {required final Items items,
      required final List<Book> books}) = _$_SearchBookState;
  _SearchBookState._() : super._();

  @override
  Items get items;
  @override
  List<Book> get books;
  @override
  @JsonKey(ignore: true)
  _$$_SearchBookStateCopyWith<_$_SearchBookState> get copyWith =>
      throw _privateConstructorUsedError;
}
