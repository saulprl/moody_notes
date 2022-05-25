import 'package:flutter/material.dart';

import '../models/emotion.dart';
import './linked_label_checkbox.dart';

class EmotionItem extends StatefulWidget {
  final String title;
  final Color color;
  final bool selected;
  void Function(String args)? onTap;
  void Function(
    String name,
    bool remove,
    List<Emotion>? derived,
  )? updateEmotions;

  EmotionItem({
    Key? key,
    required this.title,
    required this.color,
    required this.selected,
    this.onTap,
    this.updateEmotions,
  }) : super(key: key);

  @override
  State<EmotionItem> createState() => _EmotionItemState();
}

class _EmotionItemState extends State<EmotionItem> {
  var _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return LinkedLabelCheckbox(
      label: widget.title,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
      value: _selected,
      color: widget.color,
      onChanged: (value) {
        setState(() {
          _selected = value;
          widget.updateEmotions!(widget.title, value, null);
        });
      },
      onTap: widget.onTap,
    );

    // return CheckboxListTile(
    //   value: _selected,
    //   selected: _selected,
    //   checkColor: widget.color,
    //   tileColor: widget.color,
    //   selectedTileColor: widget.color,
    //   activeColor: Colors.white,
    //   title: Text(
    //     widget.title,
    //     // textAlign: TextAlign.center,
    //     style: const TextStyle(
    //       fontSize: 16.0,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   onChanged: (value) {
    //     setState(() {
    //       _selected = value!;
    //     });
    //   },
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(16.0),
    //   ),
    // );
  }
}
