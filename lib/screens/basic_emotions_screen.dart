import 'package:flutter/material.dart';
import 'package:my_anxiety_app/screens/derived_emotions_screen.dart';

import '../widgets/emotions_list.dart';

class BasicEmotionsScreen extends StatefulWidget {
  static const routeName = '/emotions-screen';

  const BasicEmotionsScreen({Key? key}) : super(key: key);

  @override
  State<BasicEmotionsScreen> createState() => _BasicEmotionsScreenState();
}

class _BasicEmotionsScreenState extends State<BasicEmotionsScreen> {
  void _onTap(String args) {
    Navigator.of(context).pushNamed(
      DerivedEmotionsScreen.routeName,
      arguments: args,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Emociones básicas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Escoge al menos una emoción básica que represente esta nota. Puedes presionar el nombre de la emoción para ver sus emociones derivadas.',
            ),
            const SizedBox(height: 12.0),
            EmotionsList(onTap: _onTap),
          ],
        ),
      ),
    );
  }
}
