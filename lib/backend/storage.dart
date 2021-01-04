import 'package:shared_preferences/shared_preferences.dart';

// Functions

storageGetInt(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int result = prefs.getInt(key);
  return result;
}

storageSetInt(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

storageGetString(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String result = prefs.getString(key);
  return result;
}

storageSetString(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
