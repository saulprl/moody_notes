import 'package:flutter/material.dart';

import '../widgets/emotions_list.dart';

class BasicEmotionsScreen extends StatefulWidget {
  static const routeName = '/emotions-screen';

  const BasicEmotionsScreen({Key? key}) : super(key: key);

  @override
  State<BasicEmotionsScreen> createState() => _BasicEmotionsScreenState();
}

class _BasicEmotionsScreenState extends State<BasicEmotionsScreen> {
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
          children: const [
            Text(
              'Escoge al menos una emoción básica que represente esta nota:',
            ),
            SizedBox(height: 12.0),
            EmotionsList(),
          ],
        ),
      ),
    );
  }
}
