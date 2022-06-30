import 'package:flutter/material.dart';

import '../../models/post.dart';

class PostDetailsText extends StatefulWidget {
  final Post selectedPost;

  const PostDetailsText(this.selectedPost, {Key? key}) : super(key: key);

  @override
  State<PostDetailsText> createState() => _PostDetailsTextState();
}

class _PostDetailsTextState extends State<PostDetailsText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: Text(
              widget.selectedPost.text,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
