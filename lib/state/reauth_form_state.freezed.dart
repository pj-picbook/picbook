// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reauth_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReAuthFormState {
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReAuthFormStateCopyWith<ReAuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReAuthFormStateCopyWith<$Res> {
  factory $ReAuthFormStateCopyWith(
          ReAuthFormState value, $Res Function(ReAuthFormState) then) =
      _$ReAuthFormStateCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$ReAuthFormStateCopyWithImpl<$Res>
    implements $ReAuthFormStateCopyWith<$Res> {
  _$ReAuthFormStateCopyWithImpl(this._value, this._then);

  final ReAuthFormState _value;
  // ignore: unused_field
  final $Res Function(ReAuthFormState) _then;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ReAuthFormStateCopyWith<$Res>
    implements $ReAuthFormStateCopyWith<$Res> {
  factory _$$_ReAuthFormStateCopyWith(
          _$_ReAuthFormState value, $Res Function(_$_ReAuthFormState) then) =
      __$$_ReAuthFormStateCopyWithImpl<$Res>;
  @override
  $Res call({String password});
}

/// @nodoc
class __$$_ReAuthFormStateCopyWithImpl<$Res>
    extends _$ReAuthFormStateCopyWithImpl<$Res>
    implements _$$_ReAuthFormStateCopyWith<$Res> {
  __$$_ReAuthFormStateCopyWithImpl(
      _$_ReAuthFormState _value, $Res Function(_$_ReAuthFormState) _then)
      : super(_value, (v) => _then(v as _$_ReAuthFormState));

  @override
  _$_ReAuthFormState get _value => super._value as _$_ReAuthFormState;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_$_ReAuthFormState(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReAuthFormState extends _ReAuthFormState with DiagnosticableTreeMixin {
  _$_ReAuthFormState({required this.password}) : super._();

  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReAuthFormState(password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReAuthFormState'))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReAuthFormState &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_ReAuthFormStateCopyWith<_$_ReAuthFormState> get copyWith =>
      __$$_ReAuthFormStateCopyWithImpl<_$_ReAuthFormState>(this, _$identity);
}

abstract class _ReAuthFormState extends ReAuthFormState {
  factory _ReAuthFormState({required final String password}) =
      _$_ReAuthFormState;
  _ReAuthFormState._() : super._();

  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_ReAuthFormStateCopyWith<_$_ReAuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
