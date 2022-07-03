import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';

import '../providers/posts.dart';

class EditTextScreen extends StatelessWidget {
  static const routeName = '/edit-text-screen';

  const EditTextScreen({Key? key}) : super(key: key);

  void _saveChanges(
    BuildContext context,
    Post post,
    String text,
  ) async {
    if (text.isEmpty) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error al editar'),
          content: const Text('El texto de la nota no puede estar vacío.'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      );
    } else {
      final updatedPost = Post(
        id: post.id,
        text: text,
        date: post.date,
        emotions: post.emotions,
      );
      await Provider.of<Posts>(context, listen: false).updatePost(updatedPost);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _post = ModalRoute.of(context)!.settings.arguments as Post;
    final _controller = TextEditingController();
    _controller.text = _post.text;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar texto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              _saveChanges(context, _post, _controller.text);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: _controller,
            minLines: 4,
            maxLines: 150,
            textAlign: TextAlign.justify,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Escribe algo...',
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            child: const Text('Borrar'),
            onPressed: () {
              _controller.text = '';
            },
          ),
          ElevatedButton(
            child: const Text('Guardar'),
            onPressed: () {
              _saveChanges(context, _post, _controller.text);
            },
          ),
        ],
      ),
    );
  }
}
