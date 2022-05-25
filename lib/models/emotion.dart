import 'package:flutter/material.dart';

class Emotion {
  final String name;
  final Color color;
  List<Emotion>? derivedEmotions;

  Emotion({
    required this.name,
    required this.color,
    this.derivedEmotions,
  });
}
