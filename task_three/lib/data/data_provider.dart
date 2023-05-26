import 'package:shared_preferences/shared_preferences.dart';

class DataProvider {
  DataProvider._();

  static final _instance = DataProvider._();

  static late SharedPreferences _preferences;

  Future init() async => _preferences = await SharedPreferences.getInstance();

  Future<void> register(String key, String data) async {
    await _preferences.setString(key, data);
  }

  String? read(String key) => _preferences.getString(key);

  bool containsKey(String key) => _preferences.containsKey(key);

  static DataProvider get instance => _instance;
}
