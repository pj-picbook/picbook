// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registered_books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisteredBooksState {
  List<Book?> get books => throw _privateConstructorUsedError;
  List<String?> get registered => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisteredBooksStateCopyWith<RegisteredBooksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisteredBooksStateCopyWith<$Res> {
  factory $RegisteredBooksStateCopyWith(RegisteredBooksState value,
          $Res Function(RegisteredBooksState) then) =
      _$RegisteredBooksStateCopyWithImpl<$Res>;
  $Res call({List<Book?> books, List<String?> registered});
}

/// @nodoc
class _$RegisteredBooksStateCopyWithImpl<$Res>
    implements $RegisteredBooksStateCopyWith<$Res> {
  _$RegisteredBooksStateCopyWithImpl(this._value, this._then);

  final RegisteredBooksState _value;
  // ignore: unused_field
  final $Res Function(RegisteredBooksState) _then;

  @override
  $Res call({
    Object? books = freezed,
    Object? registered = freezed,
  }) {
    return _then(_value.copyWith(
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book?>,
      registered: registered == freezed
          ? _value.registered
          : registered // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc
abstract class _$$_RegisteredBooksStateCopyWith<$Res>
    implements $RegisteredBooksStateCopyWith<$Res> {
  factory _$$_RegisteredBooksStateCopyWith(_$_RegisteredBooksState value,
          $Res Function(_$_RegisteredBooksState) then) =
      __$$_RegisteredBooksStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Book?> books, List<String?> registered});
}

/// @nodoc
class __$$_RegisteredBooksStateCopyWithImpl<$Res>
    extends _$RegisteredBooksStateCopyWithImpl<$Res>
    implements _$$_RegisteredBooksStateCopyWith<$Res> {
  __$$_RegisteredBooksStateCopyWithImpl(_$_RegisteredBooksState _value,
      $Res Function(_$_RegisteredBooksState) _then)
      : super(_value, (v) => _then(v as _$_RegisteredBooksState));

  @override
  _$_RegisteredBooksState get _value => super._value as _$_RegisteredBooksState;

  @override
  $Res call({
    Object? books = freezed,
    Object? registered = freezed,
  }) {
    return _then(_$_RegisteredBooksState(
      books: books == freezed
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book?>,
      registered: registered == freezed
          ? _value._registered
          : registered // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc

class _$_RegisteredBooksState extends _RegisteredBooksState {
  _$_RegisteredBooksState(
      {required final List<Book?> books,
      required final List<String?> registered})
      : _books = books,
        _registered = registered,
        super._();

  final List<Book?> _books;
  @override
  List<Book?> get books {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  final List<String?> _registered;
  @override
  List<String?> get registered {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registered);
  }

  @override
  String toString() {
    return 'RegisteredBooksState(books: $books, registered: $registered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisteredBooksState &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            const DeepCollectionEquality()
                .equals(other._registered, _registered));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_books),
      const DeepCollectionEquality().hash(_registered));

  @JsonKey(ignore: true)
  @override
  _$$_RegisteredBooksStateCopyWith<_$_RegisteredBooksState> get copyWith =>
      __$$_RegisteredBooksStateCopyWithImpl<_$_RegisteredBooksState>(
          this, _$identity);
}

abstract class _RegisteredBooksState extends RegisteredBooksState {
  factory _RegisteredBooksState(
      {required final List<Book?> books,
      required final List<String?> registered}) = _$_RegisteredBooksState;
  _RegisteredBooksState._() : super._();

  @override
  List<Book?> get books;
  @override
  List<String?> get registered;
  @override
  @JsonKey(ignore: true)
  _$$_RegisteredBooksStateCopyWith<_$_RegisteredBooksState> get copyWith =>
      throw _privateConstructorUsedError;
}
