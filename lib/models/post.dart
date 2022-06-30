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

  factory Post.fromJson(dynamic json) {
    final emotionsObjects = json['emotions'] as List;
    List<Emotion> jsonEmotions =
        emotionsObjects.map((e) => Emotion.fromJson(e)).toList();
    return Post(
      id: json['id'],
      text: json['text'],
      date: DateTime.parse(json['date']),
      emotions: jsonEmotions,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> jsonEmotions =
        emotions.map((e) => e.toJson()).toList();
    return {
      'id': id,
      'text': text,
      'date': date.toIso8601String(),
      'emotions': jsonEmotions,
    };
  }

  bool hasEmotion(String name) {
    return emotions.any((e) => e.name == name);
  }
}
