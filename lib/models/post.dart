// import 'dart:io';
import '../providers/emotion.dart';

class Post {
  final String id;
  final String text;
  final DateTime date;
  final List<Emotion> emotions;

  const Post({
    required this.id,
    required this.text,
    required this.date,
    required this.emotions,
  });
}
