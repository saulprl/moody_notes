import 'package:flutter/material.dart';

import '../../providers/emotion.dart';

class DerivedEmotionTile extends StatelessWidget {
  final List<Emotion>? specificEmotions;
  final String name;
  final Color color;

  const DerivedEmotionTile(
    this.specificEmotions, {
    required this.name,
    required this.color,
    Key? key,
  }) : super(key: key);

  Widget _tileSubtitle() {
    var subtitle = '';
    if (specificEmotions!.length > 1) {
      for (Emotion e in specificEmotions!) {
        subtitle += e.name + ' ';
      }
      subtitle = subtitle.replaceFirst(' ', ' y ');
    } else {
      for (Emotion e in specificEmotions!) {
        subtitle += e.name;
      }
    }
    return Text(subtitle);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      tileColor: color,
      title: Text(name),
      subtitle: specificEmotions != null ? _tileSubtitle() : null,
    );
  }
}
