import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static const String _kLanguageKey = 'app_language';
  static const String _kUserKey = 'user';

  static Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kLanguageKey) ?? LocalizationKey.defaultLanguage;
  }

  static Future<void> saveLanguage(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLanguageKey, languageCode);
  }

  static Future<String> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kUserKey) ?? "";
  }

  static Future<bool> saveUser(String userJson) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_kUserKey, userJson);
  }

  static Future<bool> deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_kUserKey);
  }
}
