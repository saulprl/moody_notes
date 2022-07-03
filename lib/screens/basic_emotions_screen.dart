import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/post.dart';

import '../providers/posts.dart';
import '../providers/emotions.dart';
import '../providers/post_date_preferences.dart';

import '../widgets/emotions/emotions_list.dart';

import './derived_emotions_screen.dart';

class BasicEmotionsScreen extends StatefulWidget {
  final bool? editMode;

  const BasicEmotionsScreen({Key? key, this.editMode}) : super(key: key);

  @override
  State<BasicEmotionsScreen> createState() => _BasicEmotionsScreenState();
}

class _BasicEmotionsScreenState extends State<BasicEmotionsScreen> {
  void _onTap(String args) {
    Navigator.of(context).pushNamed(
      DerivedEmotionsScreen.routeName,
      arguments: args,
    );
  }

  void _save(BuildContext context, bool askForDate) async {
    final emotionsData = Provider.of<Emotions>(
      context,
      listen: false,
    );

    if (!emotionsData.hasSelected()) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Emociones'),
            content: const Text(
                'Debes seleccionar al menos una emoción para continuar.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      try {
        emotionsData.fetchSelectedEmotions();
        final postEmotions = emotionsData.selectedEmotions;
        if (!widget.editMode!) {
          const uuid = Uuid();
          final postText = ModalRoute.of(context)!.settings.arguments as String;
          final postDate = askForDate
              ? await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.utc(2020, 8, 14),
                  lastDate: DateTime.now().add(const Duration(days: 90)),
                )
              : DateTime.now();
          await Provider.of<Posts>(context, listen: false).addPost(
            Post(
              id: uuid.v1(),
              text: postText,
              emotions: postEmotions,
              date: postDate!,
            ),
          );
        } else {
          final originalPost =
              ModalRoute.of(context)!.settings.arguments as Post;
          await Provider.of<Posts>(context, listen: false).updatePost(
            Post(
              id: originalPost.id,
              text: originalPost.text,
              emotions: emotionsData.selectedEmotions,
              date: originalPost.date,
            ),
          );
        }
        emotionsData.resetSelection();
        Navigator.of(context).pop(true);
      } catch (error) {
        debugPrint(error.toString());
        Navigator.of(context).pop(false);
        // rethrow;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Emociones básicas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Escoge al menos una emoción básica que represente esta nota. Puedes presionar el nombre de la emoción para ver sus emociones derivadas.',
            ),
            const SizedBox(height: 12.0),
            Expanded(flex: 1, child: EmotionsList(onTap: _onTap)),
            const SizedBox(height: 12.0),
            Consumer<PostDatePreferences>(
              builder: (ctx, datePref, child) => ElevatedButton(
                onPressed: () {
                  _save(ctx, datePref.askForDate);
                  // if (!emotionsData.hasSelected()) {
                  //   showDialog(
                  //     context: context,
                  //     builder: (ctx) {
                  //       return AlertDialog(
                  //         title: const Text('Emociones'),
                  //         content: const Text(
                  //             'Debes seleccionar al menos una emoción para continuar.'),
                  //         actions: [
                  //           TextButton(
                  //             onPressed: () => Navigator.of(ctx).pop(),
                  //             child: const Text('OK'),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // } else {
                  //   emotionsData.fetchSelectedEmotions();
                  //   Navigator.of(context).pop();
                  // }
                },
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
