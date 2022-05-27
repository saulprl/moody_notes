import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/basic_emotions_screen.dart';
import '../providers/emotions.dart';
import '../providers/emotion.dart';
import '../providers/posts.dart';
import '../models/post.dart';
import 'emotions_list.dart';

class TextArea extends StatefulWidget {
  const TextArea({Key? key}) : super(key: key);

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  var _isEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_isEmptyListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_isEmptyListener);
    _controller.dispose();
    super.dispose();
  }

  void _isEmptyListener() {
    if (_controller.text.isEmpty && !_isEmpty) {
      setState(() {
        _isEmpty = true;
      });
    } else if (_controller.text.isNotEmpty && _isEmpty) {
      setState(() {
        _isEmpty = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 1.0,
            ),
          ),
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            decoration: const InputDecoration(
              // label: Text('Escribe algo...'),
              hintText: 'Escribe algo...',
            ),
            autocorrect: true,
            enableSuggestions: true,
            textCapitalization: TextCapitalization.sentences,
            minLines: 6,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              child: const Text('Guardar'),
              onPressed: _isEmpty
                  ? null
                  : () async {
                      _focusNode.unfocus();
                      await Navigator.of(context)
                          .pushNamed(BasicEmotionsScreen.routeName);

                      final emotionList = Provider.of<Emotions>(
                        context,
                        listen: false,
                      ).selectedEmotions;

                      if (emotionList.isNotEmpty) {
                        Provider.of<Posts>(
                          context,
                          listen: false,
                        ).addPost(
                          Post(
                            id: DateTime.now().toIso8601String(),
                            text: _controller.text,
                            date: DateTime.now(),
                            emotions: emotionList,
                          ),
                        );
                        Provider.of<Emotions>(
                          context,
                          listen: false,
                        ).resetSelection();
                        _controller.text = '';
                      }
                    },
            ),
          ],
        )
      ],
    );
  }
}
