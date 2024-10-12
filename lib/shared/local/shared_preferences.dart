import 'package:shared_preferences/shared_preferences.dart';

class CacthHelper {
  static SharedPreferences? sharedPreferences;

  static inti() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

Future<void> putData({required String key, required bool value}) async {
await sharedPreferences!.setBool(key, value);
  }

  static Future<bool> putBoolean(String key, bool value) async {
    return sharedPreferences!.setBool(key, value);
  }
  static dynamic get_Data({required String key}) {
    return sharedPreferences?.getBool(key);
  }

  static Future<bool> Clear(String key) async {
    return await sharedPreferences!.remove(key);
  }
}