import 'package:flutter/material.dart';

import '../screens/post_details_screen.dart';
import '../models/post.dart';

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem(this.post, {Key? key}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () => Navigator.of(context).pushNamed(
            PostDetailsScreen.routeName,
            arguments: widget.post.id,
          ),
          child: ListTile(
            title: Text(widget.post.text),
            subtitle: Text(widget.post.date.toIso8601String().split('T')[0]),
          ),
        ),
      ),
    );
  }
}
