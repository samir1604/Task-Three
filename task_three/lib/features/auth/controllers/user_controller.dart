import 'package:flutter/material.dart';
import 'package:task_three/features/auth/controllers/auth_state.dart';
import 'package:task_three/features/auth/repository/auth_repository.dart';
import 'package:task_three/model/user.dart';

class UserController extends ChangeNotifier {
  UserController(this._repository) {
    _fetchRegisterUser();
  }

  final AuthRepository _repository;
  User? _currentUser;

  bool get isUserAuthenticated => _currentUser != null;
  User? get getRegisteredUser => _currentUser;
  AuthState state = const AuthState.login(null);

  void _fetchRegisterUser() {
    _currentUser = _repository.getRegisteredUser();
    notifyListeners();
  }

  Future<void> signIn(String username, String password) async {
    state = const AuthState.loading();
    notifyListeners();

    //For test only
    //await Future.delayed(const Duration(seconds: 3));

    try {
      final user = await _repository.singIn(username);

      if (user?.password != password) {
        state = const AuthState.error('User name or password are not valid');
      } else {
        _currentUser = user;
        state = AuthState.login(user);
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> singUp(User user) async {
    state = const AuthState.loading();
    notifyListeners();

    //For test only
    //await Future.delayed(const Duration(seconds: 3));

    try {
      await _repository.singUp(user);
      _currentUser = user;
      state = AuthState.signUp(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }

    notifyListeners();
  }

  Future<void> clear() async {
    await _repository.clearRegistered();
  }

  Future<void> logOut() async {
    await _repository.singOut();
    _currentUser = null;
  }
}
