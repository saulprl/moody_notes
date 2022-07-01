import 'package:flutter/material.dart';

import '../../models/post.dart';

import './post_details_emotion_item.dart';

class PostDetailsEmotionsList extends StatelessWidget {
  final Post post;

  const PostDetailsEmotionsList(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: post.emotions.length,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: PostDetailsEmotionItem(
            post.emotions[index],
            key: ValueKey(post.emotions[index].name),
          ),
        );
      },
    );
  }
}
