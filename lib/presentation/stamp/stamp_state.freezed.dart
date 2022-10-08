// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stamp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StampState {
  DateTime? get focusedDay => throw _privateConstructorUsedError;
  DateTime? get selectedDay => throw _privateConstructorUsedError;
  Map<DateTime, List<Book>>? get events => throw _privateConstructorUsedError;
  List<Book>? get books => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StampStateCopyWith<StampState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StampStateCopyWith<$Res> {
  factory $StampStateCopyWith(
          StampState value, $Res Function(StampState) then) =
      _$StampStateCopyWithImpl<$Res>;
  $Res call(
      {DateTime? focusedDay,
      DateTime? selectedDay,
      Map<DateTime, List<Book>>? events,
      List<Book>? books});
}

/// @nodoc
class _$StampStateCopyWithImpl<$Res> implements $StampStateCopyWith<$Res> {
  _$StampStateCopyWithImpl(this._value, this._then);

  final StampState _value;
  // ignore: unused_field
  final $Res Function(StampState) _then;

  @override
  $Res call({
    Object? focusedDay = freezed,
    Object? selectedDay = freezed,
    Object? events = freezed,
    Object? books = freezed,
  }) {
    return _then(_value.copyWith(
      focusedDay: focusedDay == freezed
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedDay: selectedDay == freezed
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<Book>>?,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
    ));
  }
}

/// @nodoc
abstract class _$$_StampStateCopyWith<$Res>
    implements $StampStateCopyWith<$Res> {
  factory _$$_StampStateCopyWith(
          _$_StampState value, $Res Function(_$_StampState) then) =
      __$$_StampStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? focusedDay,
      DateTime? selectedDay,
      Map<DateTime, List<Book>>? events,
      List<Book>? books});
}

/// @nodoc
class __$$_StampStateCopyWithImpl<$Res> extends _$StampStateCopyWithImpl<$Res>
    implements _$$_StampStateCopyWith<$Res> {
  __$$_StampStateCopyWithImpl(
      _$_StampState _value, $Res Function(_$_StampState) _then)
      : super(_value, (v) => _then(v as _$_StampState));

  @override
  _$_StampState get _value => super._value as _$_StampState;

  @override
  $Res call({
    Object? focusedDay = freezed,
    Object? selectedDay = freezed,
    Object? events = freezed,
    Object? books = freezed,
  }) {
    return _then(_$_StampState(
      focusedDay: focusedDay == freezed
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedDay: selectedDay == freezed
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      events: events == freezed
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<Book>>?,
      books: books == freezed
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
    ));
  }
}

/// @nodoc

class _$_StampState extends _StampState {
  _$_StampState(
      {required this.focusedDay,
      required this.selectedDay,
      required final Map<DateTime, List<Book>>? events,
      required final List<Book>? books})
      : _events = events,
        _books = books,
        super._();

  @override
  final DateTime? focusedDay;
  @override
  final DateTime? selectedDay;
  final Map<DateTime, List<Book>>? _events;
  @override
  Map<DateTime, List<Book>>? get events {
    final value = _events;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Book>? _books;
  @override
  List<Book>? get books {
    final value = _books;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StampState(focusedDay: $focusedDay, selectedDay: $selectedDay, events: $events, books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StampState &&
            const DeepCollectionEquality()
                .equals(other.focusedDay, focusedDay) &&
            const DeepCollectionEquality()
                .equals(other.selectedDay, selectedDay) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(focusedDay),
      const DeepCollectionEquality().hash(selectedDay),
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  _$$_StampStateCopyWith<_$_StampState> get copyWith =>
      __$$_StampStateCopyWithImpl<_$_StampState>(this, _$identity);
}

abstract class _StampState extends StampState {
  factory _StampState(
      {required final DateTime? focusedDay,
      required final DateTime? selectedDay,
      required final Map<DateTime, List<Book>>? events,
      required final List<Book>? books}) = _$_StampState;
  _StampState._() : super._();

  @override
  DateTime? get focusedDay;
  @override
  DateTime? get selectedDay;
  @override
  Map<DateTime, List<Book>>? get events;
  @override
  List<Book>? get books;
  @override
  @JsonKey(ignore: true)
  _$$_StampStateCopyWith<_$_StampState> get copyWith =>
      throw _privateConstructorUsedError;
}
