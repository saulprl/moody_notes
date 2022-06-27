import 'package:shared_preferences/shared_preferences.dart';

class PostDatePreference {
  static const PREF_KEY = 'ask_for_date';

  setPreference(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, value);
  }

  Future<bool> getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(PREF_KEY) ?? false;
  }
}
