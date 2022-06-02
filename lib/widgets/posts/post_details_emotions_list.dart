import 'package:flutter/material.dart';

import '../../providers/emotion.dart';
import 'post_details_emotion_item.dart';

class PostDetailsEmotionsList extends StatelessWidget {
  final List<Emotion> postEmotions;

  const PostDetailsEmotionsList(this.postEmotions, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postEmotions.length,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: PostDetailsEmotionItem(
            postEmotions[index],
            key: ValueKey(postEmotions[index].name),
          ),
        );
      },
    );
  }
}
