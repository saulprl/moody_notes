import 'package:flutter/material.dart';

import '../models/filter.dart';

class Filters with ChangeNotifier {
  final List<Filter> _filters = [
    Filter('Ira'),
    Filter('Disgusto'),
    Filter('Tristeza'),
    Filter('Felicidad'),
    Filter('Sorpresa'),
    Filter('Miedo'),
  ];

  List<Filter> get filters => [..._filters];

  void toggleFilter(String name, bool value) {
    _filters.firstWhere((f) => f.emotion == name).setValue(value);
    notifyListeners();
  }

  void clear() {
    for (Filter f in _filters) {
      f.setValue(false);
    }
    notifyListeners();
  }
}
