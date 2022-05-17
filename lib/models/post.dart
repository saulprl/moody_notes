// import 'dart:io';

class Post {
  final String id;
  final String text;
  final DateTime date;
  final List<String> emotions;

  const Post({
    required this.id,
    required this.text,
    required this.date,
    required this.emotions,
  });
}
