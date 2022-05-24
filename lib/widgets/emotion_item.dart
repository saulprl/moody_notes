import 'package:flutter/material.dart';

class EmotionItem extends StatefulWidget {
  final String title;
  final Color color;
  final bool selected;

  const EmotionItem({
    Key? key,
    required this.title,
    required this.color,
    required this.selected,
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
    return CheckboxListTile(
      value: _selected,
      selected: _selected,
      checkColor: widget.color,
      tileColor: widget.color,
      selectedTileColor: widget.color,
      activeColor: Colors.white,
      title: Text(
        widget.title,
        // textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onChanged: (value) {
        setState(() {
          _selected = value!;
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
