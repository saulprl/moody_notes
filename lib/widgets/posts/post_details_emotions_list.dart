import 'package:flutter/material.dart';

import '../../providers/emotion.dart';
import 'post_details_emotion_item.dart';

class PostDetailsEmotionsList extends StatefulWidget {
  final List<Emotion> postEmotions;

  const PostDetailsEmotionsList(this.postEmotions, {Key? key})
      : super(key: key);

  @override
  State<PostDetailsEmotionsList> createState() =>
      _PostDetailsEmotionsListState();
}

class _PostDetailsEmotionsListState extends State<PostDetailsEmotionsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.postEmotions.length,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: PostEmotionItem(widget.postEmotions[index]),
        );
      },
    );
  }
}
