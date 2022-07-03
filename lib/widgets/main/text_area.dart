import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/emotions.dart';
import '../../providers/post_date_preferences.dart';

import '../../screens/basic_emotions_screen.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
              color: _isFocused
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onBackground,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              hintText: 'Escribe algo...',
              focusColor: Theme.of(context).colorScheme.primary,
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 18.0),
            autocorrect: true,
            enableSuggestions: true,
            textCapitalization: TextCapitalization.sentences,
            minLines: 4,
            maxLines: 11,
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
                      Provider.of<Emotions>(context, listen: false)
                          .resetSelection();
                    },
            ),
            Consumer<PostDatePreferences>(
              builder: (ctx, datePref, child) => ElevatedButton(
                child: const Text('Guardar'),
                onPressed: _isEmpty
                    ? null
                    : () async {
                        // _focusNode.unfocus();
                        // var uuid = const Uuid();
                        _focusNode.unfocus();
                        Navigator.of(ctx)
                            .push<bool?>(
                          MaterialPageRoute(
                            builder: (ct) =>
                                const BasicEmotionsScreen(editMode: false),
                            settings: RouteSettings(
                              arguments: _controller.text,
                            ),
                          ),
                        )
                            .then(
                          (value) {
                            if (value != null && value) {
                              _controller.text = '';
                              ScaffoldMessenger.of(ctx).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'La nota se guardó correctamente.',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            } else if (value != null && !value) {
                              ScaffoldMessenger.of(ctx).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Ocurrió un error al guardar la nota.'),
                                  backgroundColor:
                                      Theme.of(ctx).colorScheme.error,
                                ),
                              );
                            }
                          },
                        );
                      },
              ),
            ),
          ],
        )
      ],
    );
  }
}
