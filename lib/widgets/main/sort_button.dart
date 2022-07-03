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
    final postsData = Provider.of<Posts>(context, listen: false);
    postsData.sortMode = _sortMode.index;
    return OutlinedButton(
      child: Text(
        _buttonText,
        style: const TextStyle(fontSize: 12.0),
      ),
      onPressed: () {
        _switchButtonText();
        postsData.sortMode = _sortMode.index;
        postsData.sortPosts();
      },
    );
  }
}
