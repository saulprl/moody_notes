import 'package:flutter/material.dart';

import '../../providers/emotion.dart';
import './post_emotion_item.dart';

class PostItemEmotionsList extends StatefulWidget {
  final List<Emotion> postEmotions;

  const PostItemEmotionsList(this.postEmotions, {Key? key}) : super(key: key);

  @override
  State<PostItemEmotionsList> createState() => _PostItemEmotionsListState();
}

class _PostItemEmotionsListState extends State<PostItemEmotionsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.postEmotions.length,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: PostEmotionItem(widget.postEmotions[index]),
        );
      },
    );
  }
}
