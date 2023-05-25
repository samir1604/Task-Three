import 'package:shared_preferences/shared_preferences.dart';

class PersistenceProvider {
  PersistenceProvider._();

  static final _instance = PersistenceProvider._();

  static late SharedPreferences _preferences;

  Future init() async => _preferences = await SharedPreferences.getInstance();

  Future<void> register(String key, String data) async {
    await _preferences.setString(key, data);
  }

  String? read(String key) => _preferences.getString(key);

  static PersistenceProvider get instance => _instance;
}
