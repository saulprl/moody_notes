import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

import '../models/post.dart';
import './emotion.dart';

class Posts with ChangeNotifier {
  final List<Post> _items = [
    Post(
      id: DateTime(2022, 5, 17).toIso8601String(),
      text: 'Dummy text for first item',
      date: DateTime(2022, 5, 17),
      emotions: [
        Emotion(
          name: 'Disgusto',
          color: Colors.orange,
          derivedEmotions: [
            Emotion(
              name: 'Evasivo',
              color: Colors.orange[400]!,
              derivedEmotions: [
                Emotion(name: 'Aversivo', color: Colors.orange[200]!),
                Emotion(name: 'Indeciso', color: Colors.orange[200]!),
              ],
            ),
            Emotion(
              name: 'Culpable',
              color: Colors.orange[400]!,
              derivedEmotions: [
                Emotion(name: 'Atormentado', color: Colors.orange[200]!),
                Emotion(name: 'Avergonzado', color: Colors.orange[200]!),
              ],
            ),
          ],
        ),
        Emotion(
          name: 'Tristeza',
          color: Colors.green,
          derivedEmotions: [
            Emotion(
              name: 'Solitario',
              color: Colors.green[400]!,
              derivedEmotions: [
                Emotion(name: 'Abandonado', color: Colors.green[200]!),
                Emotion(name: 'Apartado', color: Colors.green[200]!),
              ],
            ),
            Emotion(
              name: 'Ansioso',
              color: Colors.green[400]!,
              derivedEmotions: [
                Emotion(name: 'Anhelante', color: Colors.green[200]!),
                Emotion(name: 'Abrumado', color: Colors.green[200]!),
              ],
            ),
          ],
        ),
      ],
    ),
    Post(
      id: DateTime(2022, 5, 12).toIso8601String(),
      text: 'Dummy text for second item',
      date: DateTime(2022, 5, 12),
      emotions: [
        Emotion(
          name: 'Felicidad',
          color: Colors.amber,
          derivedEmotions: [
            Emotion(
              name: 'Optimista',
              color: Colors.amber[400]!,
              derivedEmotions: [
                Emotion(name: 'Inspirado', color: Colors.amber[200]!),
                Emotion(name: 'Receptivo', color: Colors.amber[200]!),
              ],
            ),
            Emotion(
              name: 'Pacífico',
              color: Colors.amber[400]!,
              derivedEmotions: [
                Emotion(name: 'Esperanzado', color: Colors.amber[200]!),
                Emotion(name: 'Amoroso', color: Colors.amber[200]!),
              ],
            ),
          ],
        ),
        Emotion(
          name: 'Miedo',
          color: Colors.purple,
          derivedEmotions: [
            Emotion(
              name: 'Inseguro',
              color: Colors.purple[400]!,
              derivedEmotions: [
                Emotion(name: 'Inferior', color: Colors.purple[200]!),
                Emotion(name: 'Pobre', color: Colors.purple[200]!),
              ],
            ),
            Emotion(
              name: 'Asustado',
              color: Colors.purple[400]!,
              derivedEmotions: [
                Emotion(name: 'Espantado', color: Colors.purple[200]!),
                Emotion(name: 'Aterrado', color: Colors.purple[200]!),
              ],
            ),
          ],
        ),
      ],
    ),
    Post(
      id: DateTime(2022, 5, 3).toIso8601String(),
      text: 'Dummy text for third item',
      date: DateTime(2022, 5, 3),
      emotions: [
        Emotion(
          name: 'Disgusto',
          color: Colors.orange,
          derivedEmotions: [
            Emotion(
              name: 'Desaprobado',
              color: Colors.orange[400]!,
              derivedEmotions: [
                Emotion(name: 'Sentencioso', color: Colors.orange[200]!),
                Emotion(name: 'Aborrecido', color: Colors.orange[200]!),
              ],
            ),
            Emotion(
              name: 'Crítico',
              color: Colors.orange[400]!,
              derivedEmotions: [
                Emotion(name: 'Sarcástico', color: Colors.orange[200]!),
                Emotion(name: 'Escéptico', color: Colors.orange[200]!),
              ],
            ),
          ],
        ),
        Emotion(
          name: 'Ira',
          color: Colors.red,
          derivedEmotions: [
            Emotion(
              name: 'Distante',
              color: Colors.red[400]!,
              derivedEmotions: [
                Emotion(name: 'Retraído', color: Colors.red[200]!),
                Emotion(name: 'Sospechoso', color: Colors.red[200]!),
              ],
            ),
            Emotion(
              name: 'Amenazado',
              color: Colors.red[400]!,
              derivedEmotions: [
                Emotion(name: 'Celoso', color: Colors.red[200]!),
                Emotion(name: 'Inseguro', color: Colors.red[200]!),
              ],
            ),
          ],
        ),
      ],
    ),
  ];

  List<Post> get items => [..._items];

  void fetchPosts() {}

  void addPost(Post newPost) {
    _items.add(newPost);
    notifyListeners();
  }

  Future<void> addSavePost(
    String text,
    List<Emotion> emotions,
    List<Emotion> generalEmotions,
  ) async {
    final post = Post(
      id: DateTime.now().toIso8601String(),
      text: text,
      emotions: emotions,
      date: DateTime.now(),
    );
    String jsonString = json.encode(post);
    final jsonPost = Post.fromJson(json.decode(jsonString));
    print(jsonPost.text);
    print(jsonPost.emotions);

    // List<Emotion> fromJson = [];
    // for (Emotion emotion in emotions) {
    //   // print(emotion.toMap());
    //   String jsonString = json.encode(emotion);
    // }

    // final appDir = await syspaths.getApplicationDocumentsDirectory();
    // final id = DateTime.now().toIso8601String();

    // final textFile = File(path.join(appDir.path, 'note-$id.txt'));
    // final emotionsFile = File(path.join(appDir.path, 'emotions-$id.txt'));
    // await textFile.writeAsString(text);
    // await emotionsFile.writeAsString(emotionNames);

    // try {
    //   final contents = await textFile.readAsString();
    //   final storedEmotions = await emotionsFile.readAsString();
    //   List<Emotion> readEmotions = [];

    //   for (String line in storedEmotions.split('\n')) {}

    //   // final postFromFile = Post(
    //   //   id: path.basename(textFile.path),
    //   //   text: contents,
    //   //   date: DateTime.parse(path.basename(textFile.path)),
    //   //   emotions:
    //   // );

    //   print('Content: $contents');
    //   print('Emotions: $storedEmotions');
    // } catch (error) {
    //   print('Sadge error ${error.toString()}');
    // }
  }

  void deletePost(String id) {
    _items.removeWhere((post) => post.id == id);
    notifyListeners();
  }
}
