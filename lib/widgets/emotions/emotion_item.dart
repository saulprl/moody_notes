import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/emotion.dart';
import '../../providers/emotions.dart';

import '../main/linked_label_checkbox.dart';

class EmotionItem extends StatefulWidget {
  final void Function(String args)? onTap;

  const EmotionItem({
    Key? key,
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
        emotionData.setSelected(emotion, value);
      },
      onTap: widget.onTap,
    );
  }
}
