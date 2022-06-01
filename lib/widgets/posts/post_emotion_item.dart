import 'dart:math';

import 'package:flutter/material.dart';

import '../../providers/emotion.dart';

class PostEmotionItem extends StatefulWidget {
  final Emotion emotion;

  const PostEmotionItem(this.emotion, {Key? key}) : super(key: key);

  @override
  State<PostEmotionItem> createState() => _PostEmotionItemState();
}

class _PostEmotionItemState extends State<PostEmotionItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: _expanded
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    )
                  : BorderRadius.circular(4.0),
            ),
            tileColor: widget.emotion.color,
            title: Text(
              widget.emotion.name,
            ),
            trailing: widget.emotion.derivedEmotions != null
                ? IconButton(
                    icon: Icon(
                      _expanded ? Icons.expand_less : Icons.expand_more,
                    ),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  )
                : null,
          ),
          if (widget.emotion.derivedEmotions != null)
            AnimatedContainer(
              decoration: BoxDecoration(
                color: widget.emotion.color,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(4.0),
                ),
              ),
              duration: const Duration(milliseconds: 300),
              constraints: BoxConstraints(
                minHeight: _expanded
                    ? widget.emotion.derivedEmotions!.length * 65.0
                    : 0.0,
                maxHeight: _expanded ? 390 : 0,
              ),
              // padding: const EdgeInsets.only(
              //   left: 16.0,
              // ),
              height: min(
                widget.emotion.derivedEmotions!.length * 65.0,
                390.0,
              ),
              child: ListView.builder(
                itemCount: widget.emotion.derivedEmotions!.length,
                itemBuilder: (ctx, index) {
                  return PostEmotionItem(
                    widget.emotion.derivedEmotions![index],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
