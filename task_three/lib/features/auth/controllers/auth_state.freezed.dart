// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) login,
    required TResult Function(User? user) signUp,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? login,
    TResult? Function(User? user)? signUp,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? login,
    TResult Function(User? user)? signUp,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateLogin value) login,
    required TResult Function(AuthStateSignUp value) signUp,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateLogin value)? login,
    TResult? Function(AuthStateSignUp value)? signUp,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateLogin value)? login,
    TResult Function(AuthStateSignUp value)? signUp,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateLoginCopyWith<$Res> {
  factory _$$AuthStateLoginCopyWith(
          _$AuthStateLogin value, $Res Function(_$AuthStateLogin) then) =
      __$$AuthStateLoginCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$AuthStateLoginCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateLogin>
    implements _$$AuthStateLoginCopyWith<$Res> {
  __$$AuthStateLoginCopyWithImpl(
      _$AuthStateLogin _value, $Res Function(_$AuthStateLogin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AuthStateLogin(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$AuthStateLogin implements AuthStateLogin {
  const _$AuthStateLogin(this.user);

  @override
  final User? user;

  @override
  String toString() {
    return 'AuthState.login(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateLogin &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateLoginCopyWith<_$AuthStateLogin> get copyWith =>
      __$$AuthStateLoginCopyWithImpl<_$AuthStateLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) login,
    required TResult Function(User? user) signUp,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return login(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? login,
    TResult? Function(User? user)? signUp,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return login?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? login,
    TResult Function(User? user)? signUp,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateLogin value) login,
    required TResult Function(AuthStateSignUp value) signUp,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateLoading value) loading,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateLogin value)? login,
    TResult? Function(AuthStateSignUp value)? signUp,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateLoading value)? loading,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateLogin value)? login,
    TResult Function(AuthStateSignUp value)? signUp,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class AuthStateLogin implements AuthState {
  const factory AuthStateLogin(final User? user) = _$AuthStateLogin;

  User? get user;
  @JsonKey(ignore: true)
  _$$AuthStateLoginCopyWith<_$AuthStateLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateSignUpCopyWith<$Res> {
  factory _$$AuthStateSignUpCopyWith(
          _$AuthStateSignUp value, $Res Function(_$AuthStateSignUp) then) =
      __$$AuthStateSignUpCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$AuthStateSignUpCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateSignUp>
    implements _$$AuthStateSignUpCopyWith<$Res> {
  __$$AuthStateSignUpCopyWithImpl(
      _$AuthStateSignUp _value, $Res Function(_$AuthStateSignUp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AuthStateSignUp(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$AuthStateSignUp implements AuthStateSignUp {
  const _$AuthStateSignUp(this.user);

  @override
  final User? user;

  @override
  String toString() {
    return 'AuthState.signUp(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateSignUp &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateSignUpCopyWith<_$AuthStateSignUp> get copyWith =>
      __$$AuthStateSignUpCopyWithImpl<_$AuthStateSignUp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) login,
    required TResult Function(User? user) signUp,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return signUp(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? login,
    TResult? Function(User? user)? signUp,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return signUp?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? login,
    TResult Function(User? user)? signUp,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateLogin value) login,
    required TResult Function(AuthStateSignUp value) signUp,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateLoading value) loading,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateLogin value)? login,
    TResult? Function(AuthStateSignUp value)? signUp,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateLoading value)? loading,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateLogin value)? login,
    TResult Function(AuthStateSignUp value)? signUp,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class AuthStateSignUp implements AuthState {
  const factory AuthStateSignUp(final User? user) = _$AuthStateSignUp;

  User? get user;
  @JsonKey(ignore: true)
  _$$AuthStateSignUpCopyWith<_$AuthStateSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateErrorCopyWith<$Res> {
  factory _$$AuthStateErrorCopyWith(
          _$AuthStateError value, $Res Function(_$AuthStateError) then) =
      __$$AuthStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthStateErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateError>
    implements _$$AuthStateErrorCopyWith<$Res> {
  __$$AuthStateErrorCopyWithImpl(
      _$AuthStateError _value, $Res Function(_$AuthStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthStateError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStateError implements AuthStateError {
  const _$AuthStateError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateErrorCopyWith<_$AuthStateError> get copyWith =>
      __$$AuthStateErrorCopyWithImpl<_$AuthStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) login,
    required TResult Function(User? user) signUp,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? login,
    TResult? Function(User? user)? signUp,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? login,
    TResult Function(User? user)? signUp,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateLogin value) login,
    required TResult Function(AuthStateSignUp value) signUp,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateLogin value)? login,
    TResult? Function(AuthStateSignUp value)? signUp,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateLogin value)? login,
    TResult Function(AuthStateSignUp value)? signUp,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthStateError implements AuthState {
  const factory AuthStateError(final String message) = _$AuthStateError;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthStateErrorCopyWith<_$AuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateLoadingCopyWith<$Res> {
  factory _$$AuthStateLoadingCopyWith(
          _$AuthStateLoading value, $Res Function(_$AuthStateLoading) then) =
      __$$AuthStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateLoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateLoading>
    implements _$$AuthStateLoadingCopyWith<$Res> {
  __$$AuthStateLoadingCopyWithImpl(
      _$AuthStateLoading _value, $Res Function(_$AuthStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateLoading implements AuthStateLoading {
  const _$AuthStateLoading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) login,
    required TResult Function(User? user) signUp,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? login,
    TResult? Function(User? user)? signUp,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? login,
    TResult Function(User? user)? signUp,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateLogin value) login,
    required TResult Function(AuthStateSignUp value) signUp,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateLogin value)? login,
    TResult? Function(AuthStateSignUp value)? signUp,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateLogin value)? login,
    TResult Function(AuthStateSignUp value)? signUp,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthStateLoading implements AuthState {
  const factory AuthStateLoading() = _$AuthStateLoading;
}
