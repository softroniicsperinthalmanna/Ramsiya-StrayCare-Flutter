import 'package:shared_preferences/shared_preferences.dart';

// Future<void> saveData(String logid) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('lid', logid);
// }
//
// Future<String?> getSavedData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? lid = prefs.getString('lid') ?? '';
//   return lid;
// }
class SharedPreferencesHelper {
  static const String loginIdKey = 'loginId';

  static Future<void> saveData(String loginId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(loginIdKey, loginId);
  }

  static Future<String> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(loginIdKey) ?? '';
  }
}
