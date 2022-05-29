import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void _showToast() {
    String postEmotions = 'Emociones de la nota: ';
    for (var i = 0; i < widget.post.emotions.length; i++) {
      if (i == widget.post.emotions.length - 1) {
        postEmotions +=
            widget.post.emotions[i].name.startsWith('I') ? ' e ' : ' y ';
        postEmotions += widget.post.emotions[i].name;
        postEmotions += '.';
      } else {
        postEmotions += widget.post.emotions[i].name;
        if (widget.post.emotions.length > 2 &&
            i != widget.post.emotions.length - 2) {
          postEmotions += ', ';
        }
      }
    }

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey,
      ),
      child: Text(postEmotions),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

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
              onLongPress: _showToast,
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
