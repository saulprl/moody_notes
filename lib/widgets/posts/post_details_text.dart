import 'package:flutter/material.dart';

import '../../models/post.dart';

class PostDetailsText extends StatefulWidget {
  final Post selectedPost;

  const PostDetailsText(this.selectedPost, {Key? key}) : super(key: key);

  @override
  State<PostDetailsText> createState() => _PostDetailsTextState();
}

class _PostDetailsTextState extends State<PostDetailsText> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.selectedPost.text;
  }

  @override
  void dispose() {
    _controller.dispose();
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              minLines: 4,
              maxLines: 26,
              readOnly: true,
              controller: _controller,
              textAlign: TextAlign.justify,
              decoration: const InputDecoration(border: InputBorder.none),
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
