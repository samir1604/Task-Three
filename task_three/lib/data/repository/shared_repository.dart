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
  Future<User?> singIn(String username) async {
    if (!_data.containsKey(username)) {
      return null;
    }

    final jsonString = _data.read(username);
    if (jsonString == null) {
      return null;
    }

    final user = User.fromJson(jsonDecode(jsonString));
    await _data.register(signedUser, user.username);
    return user;
  }

  @override
  Future<void> singOut() async {
    await _data.register(signedUser, '');
  }

  @override
  User? getRegisteredUser() {
    final userKey = _data.read(signedUser);
    if (userKey?.isEmpty ?? true) {
      return null;
    }

    final jsonString = _data.read(userKey!);
    if (jsonString == null) {
      return null;
    }

    final user = User.fromJson(jsonDecode(jsonString));
    return user;
  }

  @override
  Future<void> clearRegistered() async {
    await _data.clearRegister();
  }
}
