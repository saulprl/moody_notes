import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './derived_emotions_screen.dart';
import '../providers/emotions.dart';
import '../widgets/emotions_list.dart';

class BasicEmotionsScreen extends StatefulWidget {
  static const routeName = '/basic-emotions-screen';

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
    final emotionsData = Provider.of<Emotions>(
      context,
      listen: false,
    );

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
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                if (!emotionsData.hasSelected()) {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text('Emociones'),
                        content: const Text(
                            'Debes seleccionar al menos una emoción para continuar.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  emotionsData.fetchSelectedEmotions();
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
