import 'package:task_three/model/user.dart';

abstract class AuthRepository {
  Future<void> singUp(User user);
  Future<User?> singIn(String username);
  Future<void> singOut();
  User? getRegisteredUser();
  Future<void> clearRegistered();
}
