import 'package:flutter/material.dart';

class Filter with ChangeNotifier {
  final String emotion;
  bool value;

  Filter(this.emotion, {this.value = false});

  void setValue(bool val) {
    value = val;
    notifyListeners();
  }
}
