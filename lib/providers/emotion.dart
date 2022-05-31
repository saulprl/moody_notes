import 'dart:convert';

import 'package:flutter/material.dart';

class Emotion with ChangeNotifier {
  int? id;
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

  factory Emotion.fromJson(dynamic json) {
    if (json['derivedEmotions'] != null) {
      final emotionsObjects = json['derivedEmotions'] as List;
      List<Emotion> _derivedEmotions = emotionsObjects
          .map((emotionJson) => Emotion.fromJson(emotionJson))
          .toList();

      return Emotion(
        name: json['name'] as String,
        color: Color(json['color'] as int),
        derivedEmotions: _derivedEmotions,
        isSelected: json['isSelected'],
      );
    } else {
      return Emotion(
        name: json['name'],
        color: Color(json['color']),
        isSelected: json['isSelected'],
      );
    }
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? emotions = derivedEmotions != null
        ? derivedEmotions!.map((e) => e.toJson()).toList()
        : null;
    return {
      'name': name,
      'color': color.value,
      'derivedEmotions': emotions,
      'isSelected': isSelected,
    };
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> derived = [];
    if (derivedEmotions != null) {
      for (Emotion emotion in derivedEmotions!) {
        derived.add(emotion.toMap());
      }

      return {
        'name': name,
        'color': color.value.toString(),
        'derivedEmotions': derived,
        'isSelected': 'true',
      };
    } else {
      return {
        'name': name,
        'color': color.value.toString(),
        'isSelected': 'true',
      };
    }
  }

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
