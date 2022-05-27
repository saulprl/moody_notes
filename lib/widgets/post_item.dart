import 'package:flutter/material.dart';

import '../screens/post_details_screen.dart';
import '../models/post.dart';
import './emotions_bar.dart';

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem(this.post, {Key? key}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  Widget _colorCodes(Color color, String emotion) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          height: 9.3,
          width: 30.0,
          color: color,
        ),
        Text(
          emotion,
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).pushNamed(
              PostDetailsScreen.routeName,
              arguments: widget.post.id,
            );
          },
          child: ListTile(
            title: Text(widget.post.text),
            subtitle: Text(widget.post.date.toIso8601String().split('T')[0]),
            trailing: GestureDetector(
              child: EmotionsBar(widget.post.emotions),
              onTap: () {
                FocusScope.of(context).unfocus();

                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: const Text('Leyenda'),
                      contentPadding: const EdgeInsets.fromLTRB(
                        24.0,
                        20.0,
                        24.0,
                        12.0,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Los colores representan seis emociones principales.',
                          ),
                          _colorCodes(Colors.blue[400]!, 'Sorpresa'),
                          _colorCodes(Colors.yellow[400]!, 'Felicidad'),
                          _colorCodes(Colors.purple[400]!, 'Miedo'),
                          _colorCodes(Colors.orange[400]!, 'Disgusto'),
                          _colorCodes(Colors.red[400]!, 'Ira'),
                          _colorCodes(Colors.green[400]!, 'Tristeza'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.of(ctx).pop(),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            contentPadding: const EdgeInsets.only(
              left: 16.0,
              right: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
