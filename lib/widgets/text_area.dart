import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/posts.dart';
import '../models/post.dart';

class TextArea extends StatelessWidget {
  final _controller = TextEditingController();

  TextArea({Key? key}) : super(key: key);

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
              onPressed: () {
                Provider.of<Posts>(
                  context,
                  listen: false,
                ).addPost(
                  Post(
                    id: DateTime.now().toIso8601String(),
                    text: _controller.text,
                    date: DateTime.now(),
                    emotions: {
                      'Felicidad': {},
                      'Miedo': {
                        'Inseguro': ['Inferior', 'Pobre'],
                        'Asustado': ['Espantado', 'Aterrado'],
                      },
                    },
                  ),
                );
                _controller.text = '';
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        )
      ],
    );
  }
}
