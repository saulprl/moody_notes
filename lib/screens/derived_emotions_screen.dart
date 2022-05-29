import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './specific_emotions_screen.dart';
import '../providers/emotion.dart';
import '../providers/emotions.dart';
import '../widgets/emotions_list.dart';

class DerivedEmotionsScreen extends StatefulWidget {
  static const routeName = '/derived-emotions-screen';

  const DerivedEmotionsScreen({Key? key}) : super(key: key);

  @override
  State<DerivedEmotionsScreen> createState() => _DerivedEmotionsScreenState();
}

class _DerivedEmotionsScreenState extends State<DerivedEmotionsScreen> {
  var _isInit = false;
  late Emotion _basicEmotion;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        final basicEmotionName =
            ModalRoute.of(context)!.settings.arguments as String;

        _basicEmotion = Provider.of<Emotions>(context, listen: false)
            .emotions
            .firstWhere(
                (basicEmotion) => basicEmotion.name == basicEmotionName);
      }
      _isInit = true;
    }
  }

  void _onTap(String args) {
    Navigator.of(context).pushNamed(
      SpecificEmotionsScreen.routeName,
      arguments: args,
    );
  }

  @override
  Widget build(BuildContext context) {
    // for (Emotion emotion in _derivedEmotions) {
    //   print(emotion.name);
    //   for (Emotion specificEmotion in emotion.derivedEmotions!) {
    //     print(specificEmotion.name);
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text(_basicEmotion.name),
        backgroundColor: _basicEmotion.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Puedes elegir una o varias emociones derivadas. Si quieres ser más específico, presiona el nombre de la emoción.',
            ),
            const SizedBox(height: 12.0),
            EmotionsList(
              mainEmotion: _basicEmotion.name,
              onTap: _onTap,
            ),
          ],
        ),
      ),
    );
  }
}
