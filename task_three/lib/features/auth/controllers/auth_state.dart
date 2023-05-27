import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_three/model/user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.login(User? user) = AuthStateLogin;
  const factory AuthState.signUp(User? user) = AuthStateSignUp;
  const factory AuthState.error(String message) = AuthStateError;
  const factory AuthState.loading() = AuthStateLoading;
}
