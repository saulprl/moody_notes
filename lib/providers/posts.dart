// import 'dart:io';

import 'package:flutter/material.dart';

import '../models/post.dart';

class Posts with ChangeNotifier {
  final List<Post> _items = [
    Post(
      id: DateTime(2022, 5, 17).toIso8601String(),
      text: 'Dummy text for first item',
      date: DateTime(2022, 5, 17),
      emotions: ['Tristeza', 'Disgusto'],
    ),
    Post(
      id: DateTime(2022, 5, 12).toIso8601String(),
      text: 'Dummy text for second item',
      date: DateTime(2022, 5, 12),
      emotions: ['Felicidad', 'Miedo'],
    ),
    Post(
      id: DateTime(2022, 5, 3).toIso8601String(),
      text: 'Dummy text for third item',
      date: DateTime(2022, 5, 3),
      emotions: [
        'Disgusto',
        'Ira',
      ],
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
