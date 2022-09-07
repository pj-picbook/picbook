// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountPageState {
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountPageStateCopyWith<AccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountPageStateCopyWith<$Res> {
  factory $AccountPageStateCopyWith(
          AccountPageState value, $Res Function(AccountPageState) then) =
      _$AccountPageStateCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AccountPageStateCopyWithImpl<$Res>
    implements $AccountPageStateCopyWith<$Res> {
  _$AccountPageStateCopyWithImpl(this._value, this._then);

  final AccountPageState _value;
  // ignore: unused_field
  final $Res Function(AccountPageState) _then;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_AccountPageStateCopyWith<$Res>
    implements $AccountPageStateCopyWith<$Res> {
  factory _$$_AccountPageStateCopyWith(
          _$_AccountPageState value, $Res Function(_$_AccountPageState) then) =
      __$$_AccountPageStateCopyWithImpl<$Res>;
  @override
  $Res call({User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_AccountPageStateCopyWithImpl<$Res>
    extends _$AccountPageStateCopyWithImpl<$Res>
    implements _$$_AccountPageStateCopyWith<$Res> {
  __$$_AccountPageStateCopyWithImpl(
      _$_AccountPageState _value, $Res Function(_$_AccountPageState) _then)
      : super(_value, (v) => _then(v as _$_AccountPageState));

  @override
  _$_AccountPageState get _value => super._value as _$_AccountPageState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_AccountPageState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_AccountPageState
    with DiagnosticableTreeMixin
    implements _AccountPageState {
  _$_AccountPageState({required this.user});

  @override
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountPageState(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountPageState'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountPageState &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_AccountPageStateCopyWith<_$_AccountPageState> get copyWith =>
      __$$_AccountPageStateCopyWithImpl<_$_AccountPageState>(this, _$identity);
}

abstract class _AccountPageState implements AccountPageState {
  factory _AccountPageState({required final User user}) = _$_AccountPageState;

  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_AccountPageStateCopyWith<_$_AccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
