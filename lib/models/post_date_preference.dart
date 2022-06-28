import 'package:shared_preferences/shared_preferences.dart';

class PostDatePreference {
  static const prefKey = 'ask_for_date';

  setPreference(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(prefKey, value);
  }

  Future<bool> getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(prefKey) ?? false;
  }
}
