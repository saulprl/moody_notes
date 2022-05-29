import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/emotions_list.dart';
import '../providers/emotion.dart';
import '../providers/emotions.dart';

class SpecificEmotionsScreen extends StatefulWidget {
  static const routeName = '/specific-emotions-screen';

  const SpecificEmotionsScreen({Key? key}) : super(key: key);

  @override
  State<SpecificEmotionsScreen> createState() => _SpecificEmotionsScreenState();
}

class _SpecificEmotionsScreenState extends State<SpecificEmotionsScreen> {
  var _isInit = false;
  late Emotion _parentEmotion;

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
      }
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_parentEmotion.name),
        backgroundColor: _parentEmotion.color,
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
            ),
          ],
        ),
      ),
    );
  }
}
