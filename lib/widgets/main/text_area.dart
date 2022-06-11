import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../screens/basic_emotions_screen.dart';
import '../../providers/emotions.dart';
import '../../providers/posts.dart';
import '../../models/post.dart';

class TextArea extends StatefulWidget {
  const TextArea({Key? key}) : super(key: key);

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  var _isEmpty = true;
  var _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_isEmptyListener);
    _focusNode.addListener(_isFocusedListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_isEmptyListener);
    _controller.dispose();
    _focusNode.removeListener(_isFocusedListener);
    _focusNode.dispose();
    super.dispose();
  }

  void _isFocusedListener() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
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
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: _isFocused
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              width: 1.0,
            ),
          ),
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            decoration: InputDecoration(
              // label: Text('Escribe algo...'),
              hintText: 'Escribe algo...',
              focusColor: Theme.of(context).colorScheme.primary,
            ),
            style: const TextStyle(fontSize: 18.0),
            autocorrect: true,
            enableSuggestions: true,
            textCapitalization: TextCapitalization.sentences,
            minLines: 4,
            maxLines: 7,
            keyboardType: TextInputType.multiline,
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text('Borrar'),
              onPressed: _isEmpty
                  ? null
                  : () {
                      _controller.text = '';
                      _focusNode.unfocus();
                    },
            ),
            ElevatedButton(
              child: const Text('Guardar'),
              onPressed: _isEmpty
                  ? null
                  : () async {
                      _focusNode.unfocus();
                      var uuid = const Uuid();
                      await Navigator.of(context)
                          .pushNamed(BasicEmotionsScreen.routeName);

                      final emotionList = Provider.of<Emotions>(
                        context,
                        listen: false,
                      ).selectedEmotions;

                      if (emotionList.isNotEmpty) {
                        var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(2020, 8, 14),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        date ??= DateTime.now();
                        await Provider.of<Posts>(
                          context,
                          listen: false,
                        ).addPost(
                          Post(
                            id: uuid.v1(),
                            text: _controller.text,
                            date: date,
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
