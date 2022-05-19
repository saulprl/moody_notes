// import 'dart:io';

import 'package:flutter/material.dart';

import '../models/post.dart';

class Posts with ChangeNotifier {
  final List<Post> _items = [
    Post(
      id: DateTime(2022, 5, 17).toIso8601String(),
      text: 'Dummy text for first item',
      date: DateTime(2022, 5, 17),
      emotions: {
        'Disgusto': {
          'Evasivo': ['Aversivo', 'Indeciso'],
          'Culpable': ['Atormentado', 'Avergonzado'],
        },
        'Tristeza': {
          'Solitario': ['Abandonado', 'Apartado'],
          'Ansioso': ['Anhelante', 'Abrumado'],
        },
      },
    ),
    Post(
      id: DateTime(2022, 5, 12).toIso8601String(),
      text: 'Dummy text for second item',
      date: DateTime(2022, 5, 12),
      emotions: {
        'Felicidad': {
          'Optimista': ['Inspirado', 'Receptivo'],
          'Pacífico': ['Esperanzado', 'Amoroso'],
        },
        'Miedo': {
          'Inseguro': ['Inferior', 'Pobre'],
          'Asustado': ['Espantado', 'Aterrado'],
        },
      },
    ),
    Post(
      id: DateTime(2022, 5, 3).toIso8601String(),
      text: 'Dummy text for third item',
      date: DateTime(2022, 5, 3),
      emotions: {
        'Disgusto': {
          'Desaprobado': ['Sentencioso', 'Aborrecido'],
          'Crítico': ['Sarcástico', 'Escéptico'],
        },
        'Ira': {
          'Distante': ['Retraído', 'Sospechoso'],
          'Amenazado': ['Celoso', 'Inseguro'],
        },
      },
    ),
  ];

  List<Post> get items => [..._items];

  void fetchPosts() {}

  void addPost(Post newPost) {
    _items.add(newPost);
    notifyListeners();
  }

  void deletePost(String id) {
    _items.removeWhere((post) => post.id == id);
    notifyListeners();
  }
}
