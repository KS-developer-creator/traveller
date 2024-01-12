import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _loggedInKey = 'isLoggedIn';
  static const String _fcmTokenKey = 'fcmToken';

  // Save FCM token
  static Future<String?> saveFcmToken(String? fcmToken) async {
    if (fcmToken != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(_fcmTokenKey, fcmToken);
    }
  }

  // Retrieve FCM token
  static Future<String?> getFcmToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fcmTokenKey);
  }

  // Save login status
  static Future<void> saveLoginStatus(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_loggedInKey, isLoggedIn);
  }

  // Retrieve login status
  static Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }
}
