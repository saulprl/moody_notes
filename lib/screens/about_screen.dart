import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/main/moody_drawer.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about-screen';

  const AboutScreen({Key? key}) : super(key: key);

  void _launchUrl(String url, BuildContext ctx) async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (error) {
      showDialog(
        context: ctx,
        builder: (ct) => AlertDialog(
          title: const Text('Error de redirección'),
          content: Text(
              'Ocurrió un error al redirigirte. Por favor, contacta al desarrollador si el problema persiste. ${error.toString()}'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(ct).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de Moody Notes'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const MoodyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Moody Notes es un proyecto personal originalmente pensado para mantener una especie de diario o seguimiento de situaciones que ocurren en la vida cotidiana en forma de notas, con el añadido de asociarles emociones, por lo que sería particularmente útil para aquellas personas con ansiedad o problemas similares.',
                style: TextStyle(fontSize: 16.0),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Si encuentras algún error o tienes una sugerencia, puedes contactar al desarrollador de la aplicación por medio de las redes al final de esta pantalla.',
                style: TextStyle(fontSize: 16.0),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: const Icon(FontAwesomeIcons.twitter, size: 36.0),
                        onTap: () =>
                            _launchUrl('https://twitter.com/saulpxrl', context),
                      ),
                      GestureDetector(
                        child: const Icon(FontAwesomeIcons.github, size: 36.0),
                        onTap: () =>
                            _launchUrl('https://github.com/saulprl', context),
                      ),
                      GestureDetector(
                        child:
                            const Icon(FontAwesomeIcons.instagram, size: 36.0),
                        onTap: () => _launchUrl(
                            'https://instagram.com/saulprl', context),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       Container()
            //     )
            //   ]
            // ),
          ],
        ),
      ),
    );
  }
}
