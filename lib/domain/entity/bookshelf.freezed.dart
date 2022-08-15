// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bookshelf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bookshelf _$BookshelfFromJson(Map<String, dynamic> json) {
  return _Bookshelf.fromJson(json);
}

/// @nodoc
mixin _$Bookshelf {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String get owner => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @JsonKey(name: 'ownerBirthday')
  DateTime get ownerBirthday => throw _privateConstructorUsedError;
  @JsonKey(name: 'books')
  List<Book> get books => throw _privateConstructorUsedError;
  @JsonKey(name: 'readHistories')
  List<BookshelfHistory> get readHistories =>
      throw _privateConstructorUsedError;
  @DateTimeConverter()
  @JsonKey(name: 'created')
  DateTime get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookshelfCopyWith<Bookshelf> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookshelfCopyWith<$Res> {
  factory $BookshelfCopyWith(Bookshelf value, $Res Function(Bookshelf) then) =
      _$BookshelfCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          String id,
      @JsonKey(name: 'owner')
          String owner,
      @DateTimeConverter()
      @JsonKey(name: 'ownerBirthday')
          DateTime ownerBirthday,
      @JsonKey(name: 'books')
          List<Book> books,
      @JsonKey(name: 'readHistories')
          List<BookshelfHistory> readHistories,
      @DateTimeConverter()
      @JsonKey(name: 'created')
          DateTime created});
}

/// @nodoc
class _$BookshelfCopyWithImpl<$Res> implements $BookshelfCopyWith<$Res> {
  _$BookshelfCopyWithImpl(this._value, this._then);

  final Bookshelf _value;
  // ignore: unused_field
  final $Res Function(Bookshelf) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? owner = freezed,
    Object? ownerBirthday = freezed,
    Object? books = freezed,
    Object? readHistories = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      ownerBirthday: ownerBirthday == freezed
          ? _value.ownerBirthday
          : ownerBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      readHistories: readHistories == freezed
          ? _value.readHistories
          : readHistories // ignore: cast_nullable_to_non_nullable
              as List<BookshelfHistory>,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_BookshelfCopyWith<$Res> implements $BookshelfCopyWith<$Res> {
  factory _$$_BookshelfCopyWith(
          _$_Bookshelf value, $Res Function(_$_Bookshelf) then) =
      __$$_BookshelfCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          String id,
      @JsonKey(name: 'owner')
          String owner,
      @DateTimeConverter()
      @JsonKey(name: 'ownerBirthday')
          DateTime ownerBirthday,
      @JsonKey(name: 'books')
          List<Book> books,
      @JsonKey(name: 'readHistories')
          List<BookshelfHistory> readHistories,
      @DateTimeConverter()
      @JsonKey(name: 'created')
          DateTime created});
}

/// @nodoc
class __$$_BookshelfCopyWithImpl<$Res> extends _$BookshelfCopyWithImpl<$Res>
    implements _$$_BookshelfCopyWith<$Res> {
  __$$_BookshelfCopyWithImpl(
      _$_Bookshelf _value, $Res Function(_$_Bookshelf) _then)
      : super(_value, (v) => _then(v as _$_Bookshelf));

  @override
  _$_Bookshelf get _value => super._value as _$_Bookshelf;

  @override
  $Res call({
    Object? id = freezed,
    Object? owner = freezed,
    Object? ownerBirthday = freezed,
    Object? books = freezed,
    Object? readHistories = freezed,
    Object? created = freezed,
  }) {
    return _then(_$_Bookshelf(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      ownerBirthday: ownerBirthday == freezed
          ? _value.ownerBirthday
          : ownerBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      books: books == freezed
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      readHistories: readHistories == freezed
          ? _value._readHistories
          : readHistories // ignore: cast_nullable_to_non_nullable
              as List<BookshelfHistory>,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bookshelf extends _Bookshelf with DiagnosticableTreeMixin {
  _$_Bookshelf(
      {@JsonKey(name: 'id')
          this.id = "",
      @JsonKey(name: 'owner')
          required this.owner,
      @DateTimeConverter()
      @JsonKey(name: 'ownerBirthday')
          required this.ownerBirthday,
      @JsonKey(name: 'books')
          final List<Book> books = const [],
      @JsonKey(name: 'readHistories')
          final List<BookshelfHistory> readHistories = const [],
      @DateTimeConverter()
      @JsonKey(name: 'created')
          required this.created})
      : _books = books,
        _readHistories = readHistories,
        super._();

  factory _$_Bookshelf.fromJson(Map<String, dynamic> json) =>
      _$$_BookshelfFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'owner')
  final String owner;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'ownerBirthday')
  final DateTime ownerBirthday;
  final List<Book> _books;
  @override
  @JsonKey(name: 'books')
  List<Book> get books {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  final List<BookshelfHistory> _readHistories;
  @override
  @JsonKey(name: 'readHistories')
  List<BookshelfHistory> get readHistories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readHistories);
  }

  @override
  @DateTimeConverter()
  @JsonKey(name: 'created')
  final DateTime created;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Bookshelf(id: $id, owner: $owner, ownerBirthday: $ownerBirthday, books: $books, readHistories: $readHistories, created: $created)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Bookshelf'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('owner', owner))
      ..add(DiagnosticsProperty('ownerBirthday', ownerBirthday))
      ..add(DiagnosticsProperty('books', books))
      ..add(DiagnosticsProperty('readHistories', readHistories))
      ..add(DiagnosticsProperty('created', created));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bookshelf &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            const DeepCollectionEquality()
                .equals(other.ownerBirthday, ownerBirthday) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            const DeepCollectionEquality()
                .equals(other._readHistories, _readHistories) &&
            const DeepCollectionEquality().equals(other.created, created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(owner),
      const DeepCollectionEquality().hash(ownerBirthday),
      const DeepCollectionEquality().hash(_books),
      const DeepCollectionEquality().hash(_readHistories),
      const DeepCollectionEquality().hash(created));

  @JsonKey(ignore: true)
  @override
  _$$_BookshelfCopyWith<_$_Bookshelf> get copyWith =>
      __$$_BookshelfCopyWithImpl<_$_Bookshelf>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookshelfToJson(
      this,
    );
  }
}

abstract class _Bookshelf extends Bookshelf {
  factory _Bookshelf(
      {@JsonKey(name: 'id')
          final String id,
      @JsonKey(name: 'owner')
          required final String owner,
      @DateTimeConverter()
      @JsonKey(name: 'ownerBirthday')
          required final DateTime ownerBirthday,
      @JsonKey(name: 'books')
          final List<Book> books,
      @JsonKey(name: 'readHistories')
          final List<BookshelfHistory> readHistories,
      @DateTimeConverter()
      @JsonKey(name: 'created')
          required final DateTime created}) = _$_Bookshelf;
  _Bookshelf._() : super._();

  factory _Bookshelf.fromJson(Map<String, dynamic> json) =
      _$_Bookshelf.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'owner')
  String get owner;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'ownerBirthday')
  DateTime get ownerBirthday;
  @override
  @JsonKey(name: 'books')
  List<Book> get books;
  @override
  @JsonKey(name: 'readHistories')
  List<BookshelfHistory> get readHistories;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'created')
  DateTime get created;
  @override
  @JsonKey(ignore: true)
  _$$_BookshelfCopyWith<_$_Bookshelf> get copyWith =>
      throw _privateConstructorUsedError;
}
