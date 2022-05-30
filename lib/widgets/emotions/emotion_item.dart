import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/emotion.dart';
import '../../providers/emotions.dart';
import '../main/linked_label_checkbox.dart';

class EmotionItem extends StatefulWidget {
  // final String title;
  // final Color color;
  // final bool selected;
  final void Function(String args)? onTap;

  const EmotionItem({
    Key? key,
    // required this.title,
    // required this.color,
    // required this.selected,
    this.onTap,
  }) : super(key: key);

  @override
  State<EmotionItem> createState() => _EmotionItemState();
}

class _EmotionItemState extends State<EmotionItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emotion = Provider.of<Emotion>(context);
    final emotionData = Provider.of<Emotions>(context, listen: false);

    return LinkedLabelCheckbox(
      label: emotion.name,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
      value: emotion.isSelected,
      color: emotion.color,
      onChanged: (value) {
        // setState(() {
        // emotion.toggleSelected();
        // widget.updateEmotions!(widget.title, value, null);
        // });
        emotionData.setSelected(emotion, value);
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
