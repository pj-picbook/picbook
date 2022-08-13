// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tab_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TabState {
  TabItem get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabStateCopyWith<TabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabStateCopyWith<$Res> {
  factory $TabStateCopyWith(TabState value, $Res Function(TabState) then) =
      _$TabStateCopyWithImpl<$Res>;
  $Res call({TabItem item});
}

/// @nodoc
class _$TabStateCopyWithImpl<$Res> implements $TabStateCopyWith<$Res> {
  _$TabStateCopyWithImpl(this._value, this._then);

  final TabState _value;
  // ignore: unused_field
  final $Res Function(TabState) _then;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as TabItem,
    ));
  }
}

/// @nodoc
abstract class _$$_TabStateCopyWith<$Res> implements $TabStateCopyWith<$Res> {
  factory _$$_TabStateCopyWith(
          _$_TabState value, $Res Function(_$_TabState) then) =
      __$$_TabStateCopyWithImpl<$Res>;
  @override
  $Res call({TabItem item});
}

/// @nodoc
class __$$_TabStateCopyWithImpl<$Res> extends _$TabStateCopyWithImpl<$Res>
    implements _$$_TabStateCopyWith<$Res> {
  __$$_TabStateCopyWithImpl(
      _$_TabState _value, $Res Function(_$_TabState) _then)
      : super(_value, (v) => _then(v as _$_TabState));

  @override
  _$_TabState get _value => super._value as _$_TabState;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_TabState(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as TabItem,
    ));
  }
}

/// @nodoc

class _$_TabState extends _TabState {
  _$_TabState({required this.item}) : super._();

  @override
  final TabItem item;

  @override
  String toString() {
    return 'TabState(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabState &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_TabStateCopyWith<_$_TabState> get copyWith =>
      __$$_TabStateCopyWithImpl<_$_TabState>(this, _$identity);
}

abstract class _TabState extends TabState {
  factory _TabState({required final TabItem item}) = _$_TabState;
  _TabState._() : super._();

  @override
  TabItem get item;
  @override
  @JsonKey(ignore: true)
  _$$_TabStateCopyWith<_$_TabState> get copyWith =>
      throw _privateConstructorUsedError;
}
