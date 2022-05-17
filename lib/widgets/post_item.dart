import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  final String text;
  final DateTime date;
  final List<String> emotions;

  const PostItem(this.text, this.date, this.emotions, {Key? key})
      : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.text),
        subtitle: Text(widget.date.toIso8601String().split('T')[0]),
      ),
    );
  }
}
