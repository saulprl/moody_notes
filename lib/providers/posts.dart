import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

import '../models/db_exception.dart';
import '../helpers/db_helper.dart';
import '../models/post.dart';
import './emotion.dart';

class Posts with ChangeNotifier {
  final List<Post> _items = [
    // Post(
    //   id: DateTime(2022, 5, 17).toIso8601String(),
    //   text: 'Dummy text for first item',
    //   date: DateTime(2022, 5, 17),
    //   emotions: [
    //     Emotion(
    //       name: 'Disgusto',
    //       color: Colors.orange,
    //       derivedEmotions: [
    //         Emotion(
    //           name: 'Evasivo',
    //           color: Colors.orange[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Aversivo', color: Colors.orange[200]!),
    //             Emotion(name: 'Indeciso', color: Colors.orange[200]!),
    //           ],
    //         ),
    //         Emotion(
    //           name: 'Culpable',
    //           color: Colors.orange[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Atormentado', color: Colors.orange[200]!),
    //             Emotion(name: 'Avergonzado', color: Colors.orange[200]!),
    //           ],
    //         ),
    //       ],
    //     ),
    //     Emotion(
    //       name: 'Tristeza',
    //       color: Colors.green,
    //       derivedEmotions: [
    //         Emotion(
    //           name: 'Solitario',
    //           color: Colors.green[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Abandonado', color: Colors.green[200]!),
    //             Emotion(name: 'Apartado', color: Colors.green[200]!),
    //           ],
    //         ),
    //         Emotion(
    //           name: 'Ansioso',
    //           color: Colors.green[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Anhelante', color: Colors.green[200]!),
    //             Emotion(name: 'Abrumado', color: Colors.green[200]!),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    // Post(
    //   id: DateTime(2022, 5, 12).toIso8601String(),
    //   text: 'Dummy text for second item',
    //   date: DateTime(2022, 5, 12),
    //   emotions: [
    //     Emotion(
    //       name: 'Felicidad',
    //       color: Colors.amber,
    //       derivedEmotions: [
    //         Emotion(
    //           name: 'Optimista',
    //           color: Colors.amber[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Inspirado', color: Colors.amber[200]!),
    //             Emotion(name: 'Receptivo', color: Colors.amber[200]!),
    //           ],
    //         ),
    //         Emotion(
    //           name: 'Pacífico',
    //           color: Colors.amber[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Esperanzado', color: Colors.amber[200]!),
    //             Emotion(name: 'Amoroso', color: Colors.amber[200]!),
    //           ],
    //         ),
    //       ],
    //     ),
    //     Emotion(
    //       name: 'Miedo',
    //       color: Colors.purple,
    //       derivedEmotions: [
    //         Emotion(
    //           name: 'Inseguro',
    //           color: Colors.purple[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Inferior', color: Colors.purple[200]!),
    //             Emotion(name: 'Pobre', color: Colors.purple[200]!),
    //           ],
    //         ),
    //         Emotion(
    //           name: 'Asustado',
    //           color: Colors.purple[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Espantado', color: Colors.purple[200]!),
    //             Emotion(name: 'Aterrado', color: Colors.purple[200]!),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    // Post(
    //   id: DateTime(2022, 5, 3).toIso8601String(),
    //   text: 'Dummy text for third item',
    //   date: DateTime(2022, 5, 3),
    //   emotions: [
    //     Emotion(
    //       name: 'Disgusto',
    //       color: Colors.orange,
    //       derivedEmotions: [
    //         Emotion(
    //           name: 'Desaprobado',
    //           color: Colors.orange[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Sentencioso', color: Colors.orange[200]!),
    //             Emotion(name: 'Aborrecido', color: Colors.orange[200]!),
    //           ],
    //         ),
    //         Emotion(
    //           name: 'Crítico',
    //           color: Colors.orange[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Sarcástico', color: Colors.orange[200]!),
    //             Emotion(name: 'Escéptico', color: Colors.orange[200]!),
    //           ],
    //         ),
    //       ],
    //     ),
    //     Emotion(
    //       name: 'Ira',
    //       color: Colors.red,
    //       derivedEmotions: [
    //         Emotion(
    //           name: 'Distante',
    //           color: Colors.red[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Retraído', color: Colors.red[200]!),
    //             Emotion(name: 'Sospechoso', color: Colors.red[200]!),
    //           ],
    //         ),
    //         Emotion(
    //           name: 'Amenazado',
    //           color: Colors.red[400]!,
    //           derivedEmotions: [
    //             Emotion(name: 'Celoso', color: Colors.red[200]!),
    //             Emotion(name: 'Inseguro', color: Colors.red[200]!),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ];

  List<Post> get items => [..._items];

  Future<void> fetchPosts() async {
    _items.clear();
    notifyListeners();
    final dataList = await DBHelper.fetchData('posts');
    for (Map<String, dynamic> map in dataList) {
      try {
        final jsonFile = File(map['post_path']);
        final jsonString = await jsonFile.readAsString();
        _items.add(Post.fromJson(json.decode(jsonString)));
      } catch (error) {
        print('Fetch sadge ${error.toString()}');
      }
    }
    notifyListeners();
  }

  Future<void> addPost(Post newPost) async {
    _items.add(newPost);
    notifyListeners();

    try {
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final postToJson = File(path.join(appDir.path, '${newPost.id}.json'));
      final encodedPost = json.encode(newPost);
      await postToJson.writeAsString(encodedPost);

      final insertedId = await DBHelper.insert(
        'posts',
        {
          'post_id': newPost.id,
          'post_path': postToJson.path,
        },
      );

      if (insertedId < 0) {
        throw DBException('Ocurrió un problema al guardar la nota.');
      }
    } catch (error) {
      _items.remove(newPost);
      notifyListeners();
      print('Sadge error ${error.toString()}');
    }
  }

  void deletePost(String id) {
    _items.removeWhere((post) => post.id == id);
    notifyListeners();
  }
}
