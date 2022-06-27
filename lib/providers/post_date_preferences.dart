import 'package:flutter/material.dart';

import '../models/post_date_preference.dart';

class PostDatePreferences with ChangeNotifier {
  PostDatePreferences() {
    _getPreference();
  }

  var _askForDate = false;
  final _preference = PostDatePreference();

  bool get askForDate => _askForDate;

  set askForDate(bool value) {
    _askForDate = value;
    _preference.setPreference(value);
    notifyListeners();
  }

  void _getPreference() async {
    _askForDate = await _preference.getPreference();
    notifyListeners();
  }
}
