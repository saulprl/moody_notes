import 'package:flutter/material.dart';

import '../providers/emotion.dart';

class EmotionsBar extends StatelessWidget {
  final List<Emotion> emotions;

  const EmotionsBar(this.emotions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, _) {
      var containerList = <Widget>[];
      final containerHeight = 56.0 / emotions.length;
      const containerWidth = 30.0;

      for (Emotion emotion in emotions) {
        containerList.add(
          Container(
            height: containerHeight,
            width: containerWidth,
            color: emotion.color,
          ),
        );
      }

      return Column(
        children: containerList,
      );
    });
  }
}
