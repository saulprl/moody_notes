import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/emotions_list.dart';
import '../models/emotion.dart';
import '../providers/emotions.dart';

class SpecificEmotionsScreen extends StatefulWidget {
  static const routeName = '/specific-emotions';

  const SpecificEmotionsScreen({Key? key}) : super(key: key);

  @override
  State<SpecificEmotionsScreen> createState() => _SpecificEmotionsScreenState();
}

class _SpecificEmotionsScreenState extends State<SpecificEmotionsScreen> {
  var _isInit = false;
  late Emotion _parentEmotion;
  late List<Emotion> _specificEmotions;
  final List<Emotion> _selectedEmotions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        final parentEmotionName =
            ModalRoute.of(context)!.settings.arguments as String;

        _parentEmotion = Provider.of<Emotions>(
          context,
          listen: false,
        ).findByName(parentEmotionName);

        _specificEmotions = Provider.of<Emotions>(
          context,
          listen: false,
        ).findListByName(parentEmotionName);
      }
      _isInit = true;
    }
  }

  void _updateEmotions(String name, bool remove, List<Emotion>? derived) {
    if (!remove) {
      setState(() {
        _selectedEmotions.removeWhere((emotion) => emotion.name == name);
      });
    } else {
      setState(() {
        _selectedEmotions.add(Emotion(
          name: name,
          color: _specificEmotions.first.color,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_parentEmotion.name),
        backgroundColor: _parentEmotion.color,
        actions: [
          IconButton(
            onPressed: _selectedEmotions.isEmpty ? null : () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Finalmente, puedes elegir una o varias emociones específicas.',
            ),
            const SizedBox(height: 12.0),
            EmotionsList(
              mainEmotion: _parentEmotion.name,
              updateEmotions: _updateEmotions,
            ),
          ],
        ),
      ),
    );
  }
}
