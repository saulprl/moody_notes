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

      // for (var emotion in emotions.keys) {
      //   if (emotions[emotion] != null) {
      //     for (var derivedEmotion in emotions[emotion]!.keys) {
      //       print(emotions[emotion]![derivedEmotion]![1]);
      //     }
      //   }
      // }
      /*
      TODO: Add a widget containing all 72 emotions in order to let the user 
      select which emotions that particular post makes them feel.
      */

      for (Emotion emotion in emotions) {
        containerList.add(
          Container(
            height: containerHeight,
            width: containerWidth,
            color: emotion.color,
          ),
        );
      }

      // if (emotions.containsKey('Ira')) {
      //   containerList.add(
      //     Container(
      //       height: containerHeight,
      //       width: containerWidth,
      //       color: Colors.red[400],
      //     ),
      //   );
      // }

      // if (emotions.containsKey('Disgusto')) {
      //   containerList.add(
      //     Container(
      //       height: containerHeight,
      //       width: containerWidth,
      //       color: Colors.orange[400],
      //     ),
      //   );
      // }

      // if (emotions.containsKey('Tristeza')) {
      //   containerList.add(
      //     Container(
      //       height: containerHeight,
      //       width: containerWidth,
      //       color: Colors.green[400],
      //     ),
      //   );
      // }

      // if (emotions.containsKey('Felicidad')) {
      //   containerList.add(
      //     Container(
      //       height: containerHeight,
      //       width: containerWidth,
      //       color: Colors.yellow[400],
      //     ),
      //   );
      // }

      // if (emotions.containsKey('Sorpresa')) {
      //   containerList.add(
      //     Container(
      //       height: containerHeight,
      //       width: containerWidth,
      //       color: Colors.blue[400],
      //     ),
      //   );
      // }

      // if (emotions.containsKey('Miedo')) {
      //   containerList.add(
      //     Container(
      //       height: containerHeight,
      //       width: containerWidth,
      //       color: Colors.purple[400],
      //     ),
      //   );
      // }

      return Column(
        children: containerList,
      );
    });
  }
}
