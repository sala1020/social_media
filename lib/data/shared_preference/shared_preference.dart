import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _key = 'is_logged_in'; // Change this key as needed

  // Write a boolean value to SharedPreferences
  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }

  // Read a boolean value from SharedPreferences
  static Future<bool?> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key);
  }
}
