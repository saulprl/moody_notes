import 'package:flutter/material.dart';

class Emotion with ChangeNotifier {
  final int? id;
  final String name;
  final Color color;
  List<Emotion>? derivedEmotions;
  bool isSelected;

  Emotion({
    this.id,
    required this.name,
    required this.color,
    this.derivedEmotions,
    this.isSelected = false,
  });

  void setSelected(bool value) {
    isSelected = value;
    notifyListeners();
  }
}
