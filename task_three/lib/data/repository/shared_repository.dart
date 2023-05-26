import 'dart:convert';

import 'package:task_three/data/data_provider.dart';
import 'package:task_three/features/auth/repository/auth_repository.dart';
import 'package:task_three/model/user.dart';

const signedUser = 'signedUser';

class SharedRepository implements AuthRepository {
  SharedRepository(DataProvider data) : _data = data;
  final DataProvider _data;

  @override
  Future<void> singUp(User user) async {
    final json = user.toJson();
    if (_data.containsKey(user.username)) {
      throw Exception('User already exists');
    }
    await _data.register(user.username, jsonEncode(json));
  }

  @override
  Future<User?> singIn(String username, String password) async {
    final user = _getUser(username);

    if (user == null) {
      return null;
    }

    await _data.register(signedUser, user.username);
    return user;
  }

  @override
  Future<void> singOut(String username) async {
    await _data.register(signedUser, '');
  }

  @override
  Future<User?> getRegisteredUser() async {
    return _getUser(signedUser);
  }

  User? _getUser(String key) {
    final jsonString = _data.read(key);
    if (jsonString?.isEmpty ?? false) {
      return null;
    }

    final user = User.fromJson(jsonDecode(jsonString!));
    return user;
  }
}
