import 'package:flutter/material.dart';
import 'package:task_three/features/auth/repository/auth_repository.dart';
import 'package:task_three/model/user.dart';

class LoginController extends ChangeNotifier {
  LoginController(this._repository) {
    getRegisterUser();
  }

  final AuthRepository _repository;

  bool _isUserAuthenticated = false;
  bool get isUserAuthenticated => _isUserAuthenticated;

  User? _currentUser;
  User? get getRegisteredUser => _currentUser;

  void getRegisterUser() {
    _currentUser = _repository.getRegisteredUser();
    _isUserAuthenticated = (_currentUser != null);
    notifyListeners();
  }
}
