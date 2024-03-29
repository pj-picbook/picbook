// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mypage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyPageState {
  User get user => throw _privateConstructorUsedError;
  Bookshelf get currentBookshelf => throw _privateConstructorUsedError;
  List<Book>? get books => throw _privateConstructorUsedError;
  List<BookshelfHistory> get bookshelfHistory =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPageStateCopyWith<MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageStateCopyWith<$Res> {
  factory $MyPageStateCopyWith(
          MyPageState value, $Res Function(MyPageState) then) =
      _$MyPageStateCopyWithImpl<$Res>;
  $Res call(
      {User user,
      Bookshelf currentBookshelf,
      List<Book>? books,
      List<BookshelfHistory> bookshelfHistory});

  $UserCopyWith<$Res> get user;
  $BookshelfCopyWith<$Res> get currentBookshelf;
}

/// @nodoc
class _$MyPageStateCopyWithImpl<$Res> implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._value, this._then);

  final MyPageState _value;
  // ignore: unused_field
  final $Res Function(MyPageState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? currentBookshelf = freezed,
    Object? books = freezed,
    Object? bookshelfHistory = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      currentBookshelf: currentBookshelf == freezed
          ? _value.currentBookshelf
          : currentBookshelf // ignore: cast_nullable_to_non_nullable
              as Bookshelf,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      bookshelfHistory: bookshelfHistory == freezed
          ? _value.bookshelfHistory
          : bookshelfHistory // ignore: cast_nullable_to_non_nullable
              as List<BookshelfHistory>,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $BookshelfCopyWith<$Res> get currentBookshelf {
    return $BookshelfCopyWith<$Res>(_value.currentBookshelf, (value) {
      return _then(_value.copyWith(currentBookshelf: value));
    });
  }
}

/// @nodoc
abstract class _$$_MyPageStateCopyWith<$Res>
    implements $MyPageStateCopyWith<$Res> {
  factory _$$_MyPageStateCopyWith(
          _$_MyPageState value, $Res Function(_$_MyPageState) then) =
      __$$_MyPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {User user,
      Bookshelf currentBookshelf,
      List<Book>? books,
      List<BookshelfHistory> bookshelfHistory});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $BookshelfCopyWith<$Res> get currentBookshelf;
}

/// @nodoc
class __$$_MyPageStateCopyWithImpl<$Res> extends _$MyPageStateCopyWithImpl<$Res>
    implements _$$_MyPageStateCopyWith<$Res> {
  __$$_MyPageStateCopyWithImpl(
      _$_MyPageState _value, $Res Function(_$_MyPageState) _then)
      : super(_value, (v) => _then(v as _$_MyPageState));

  @override
  _$_MyPageState get _value => super._value as _$_MyPageState;

  @override
  $Res call({
    Object? user = freezed,
    Object? currentBookshelf = freezed,
    Object? books = freezed,
    Object? bookshelfHistory = freezed,
  }) {
    return _then(_$_MyPageState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      currentBookshelf: currentBookshelf == freezed
          ? _value.currentBookshelf
          : currentBookshelf // ignore: cast_nullable_to_non_nullable
              as Bookshelf,
      books: books == freezed
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      bookshelfHistory: bookshelfHistory == freezed
          ? _value._bookshelfHistory
          : bookshelfHistory // ignore: cast_nullable_to_non_nullable
              as List<BookshelfHistory>,
    ));
  }
}

/// @nodoc

class _$_MyPageState extends _MyPageState {
  _$_MyPageState(
      {required this.user,
      required this.currentBookshelf,
      required final List<Book>? books,
      required final List<BookshelfHistory> bookshelfHistory})
      : _books = books,
        _bookshelfHistory = bookshelfHistory,
        super._();

  @override
  final User user;
  @override
  final Bookshelf currentBookshelf;
  final List<Book>? _books;
  @override
  List<Book>? get books {
    final value = _books;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BookshelfHistory> _bookshelfHistory;
  @override
  List<BookshelfHistory> get bookshelfHistory {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookshelfHistory);
  }

  @override
  String toString() {
    return 'MyPageState(user: $user, currentBookshelf: $currentBookshelf, books: $books, bookshelfHistory: $bookshelfHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPageState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.currentBookshelf, currentBookshelf) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            const DeepCollectionEquality()
                .equals(other._bookshelfHistory, _bookshelfHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(currentBookshelf),
      const DeepCollectionEquality().hash(_books),
      const DeepCollectionEquality().hash(_bookshelfHistory));

  @JsonKey(ignore: true)
  @override
  _$$_MyPageStateCopyWith<_$_MyPageState> get copyWith =>
      __$$_MyPageStateCopyWithImpl<_$_MyPageState>(this, _$identity);
}

abstract class _MyPageState extends MyPageState {
  factory _MyPageState(
      {required final User user,
      required final Bookshelf currentBookshelf,
      required final List<Book>? books,
      required final List<BookshelfHistory> bookshelfHistory}) = _$_MyPageState;
  _MyPageState._() : super._();

  @override
  User get user;
  @override
  Bookshelf get currentBookshelf;
  @override
  List<Book>? get books;
  @override
  List<BookshelfHistory> get bookshelfHistory;
  @override
  @JsonKey(ignore: true)
  _$$_MyPageStateCopyWith<_$_MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
