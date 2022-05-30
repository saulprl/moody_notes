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

  @override
  String toString() {
    var emotionNames = '';
    emotionNames += name + ' ';
    if (derivedEmotions != null) {
      for (Emotion emotion in derivedEmotions!) {
        emotionNames += emotion.toString();
      }
    }
    return emotionNames;
  }

  void setSelected(bool value) {
    isSelected = value;
    notifyListeners();
  }
}
