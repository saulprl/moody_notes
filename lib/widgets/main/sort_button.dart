import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/posts.dart';

enum SortMode {
  oldest,
  newest,
}

class SortButton extends StatefulWidget {
  const SortButton({Key? key}) : super(key: key);

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  SortMode _sortMode = SortMode.newest;
  late String _buttonText;

  @override
  void initState() {
    super.initState();
    _buttonText = _sortMode == SortMode.newest
        ? 'Más recientes primero'
        : 'Más antiguas primero';
  }

  void _switchButtonText() {
    setState(() {
      _sortMode =
          _sortMode == SortMode.newest ? SortMode.oldest : SortMode.newest;
      _buttonText = _sortMode == SortMode.newest
          ? 'Más recientes primero'
          : 'Más antiguas primero';
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        _buttonText,
        style: const TextStyle(color: Colors.white, fontSize: 12.0),
      ),
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          ),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        visualDensity: VisualDensity.compact,
      ),
      onPressed: () {
        _switchButtonText();

        Provider.of<Posts>(context, listen: false).sortPosts(_sortMode.index);
      },
    );
  }
}
