import 'package:task_three/model/user.dart';

abstract class AuthRepository {
  Future<void> singUp(User user);
  Future<User?> singIn(String username, String password);
  Future<void> singOut(String username);
  User? getRegisteredUser();
}
