import 'package:flutter/material.dart';

import '../models/theme_preference.dart';

class ThemePreferences with ChangeNotifier {
  ThemePreferences() {
    _getPreferences();
  }

  var _isDark = true;
  final _preference = ThemePreference();

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    _preference.setTheme(value);
    notifyListeners();
  }

  void _getPreferences() async {
    _isDark = await _preference.getTheme();
    notifyListeners();
  }
}
