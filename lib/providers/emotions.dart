import 'package:flutter/material.dart';

import '../models/emotion.dart';

class Emotions with ChangeNotifier {
  final List<Emotion> _emotions = [
    Emotion(
      name: 'Ira',
      color: Colors.red,
      derivedEmotions: [
        Emotion(
          name: 'Amenazado',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(name: 'Inseguro', color: Colors.red[200]!),
            Emotion(name: 'Celoso', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          name: 'Odioso',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(name: 'Resentido', color: Colors.red[200]!),
            Emotion(name: 'Violado', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          name: 'Desquiciado',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(name: 'Enfurecido', color: Colors.red[200]!),
            Emotion(name: 'Rabioso', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          name: 'Agresivo',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(name: 'Provocado', color: Colors.red[200]!),
            Emotion(name: 'Hostil', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          name: 'Frustrado',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(name: 'Enfadado', color: Colors.red[200]!),
            Emotion(name: 'Irritado', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          name: 'Distante',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(name: 'Retirado', color: Colors.red[200]!),
            Emotion(name: 'Sospechoso', color: Colors.red[200]!),
          ],
        ),
      ],
    ),
    Emotion(
      name: 'Disgusto',
      color: Colors.orange,
      derivedEmotions: [
        Emotion(
          name: 'Crítico',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(name: 'Sarcástico', color: Colors.orange[200]!),
            Emotion(name: 'Escéptico', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          name: 'Desaprobado',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(name: 'Sentencioso', color: Colors.orange[200]!),
            Emotion(name: 'Aborrecido', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          name: 'Decepcionado',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(name: 'Repugnante', color: Colors.orange[200]!),
            Emotion(name: 'Rebelado', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          name: 'Terrible',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(name: 'Repulsivo', color: Colors.orange[200]!),
            Emotion(name: 'Detestable', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          name: 'Evasivo',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(name: 'Aversivo', color: Colors.orange[200]!),
            Emotion(name: 'Indeciso', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          name: 'Culpable',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(name: 'Atormentado', color: Colors.orange[200]!),
            Emotion(name: 'Avergonzado', color: Colors.orange[200]!),
          ],
        ),
      ],
    ),
    Emotion(
      name: 'Tristeza',
      color: Colors.green,
      derivedEmotions: [
        Emotion(
          name: 'Ansioso',
          color: Colors.green[400]!,
          derivedEmotions: [
            Emotion(name: 'Anhelante', color: Colors.green[200]!),
            Emotion(name: 'Abrumado', color: Colors.green[200]!),
          ],
        ),
        Emotion(
          name: 'Abandonado',
          color: Colors.green[400]!,
          derivedEmotions: [
            Emotion(name: 'Ignorado', color: Colors.green[200]!),
            Emotion(name: 'Discriminado', color: Colors.green[200]!),
          ],
        ),
        Emotion(
          name: 'Desesperado',
          color: Colors.green[400]!,
          derivedEmotions: [
            Emotion(name: 'Impotente', color: Colors.green[200]!),
            Emotion(name: 'Vulnerable', color: Colors.green[200]!),
          ],
        ),
        Emotion(
          name: 'Deprimido',
          color: Colors.green[400]!,
          derivedEmotions: [
            Emotion(name: 'Inferior', color: Colors.green[200]!),
            Emotion(name: 'Vacío', color: Colors.green[200]!),
          ],
        ),
        Emotion(
          name: 'Solitario',
          color: Colors.green[400]!,
          derivedEmotions: [
            Emotion(name: 'Abandonado', color: Colors.green[200]!),
            Emotion(name: 'Apartado', color: Colors.green[200]!),
          ],
        ),
        Emotion(
          name: 'Aburrido',
          color: Colors.green[400]!,
          derivedEmotions: [
            Emotion(name: 'Apático', color: Colors.green[200]!),
            Emotion(name: 'Indiferente', color: Colors.green[200]!),
          ],
        ),
      ],
    ),
    Emotion(
      name: 'Felicidad',
      color: Colors.amber,
      derivedEmotions: [
        Emotion(
          name: 'Optimista',
          color: Colors.amber[400]!,
          derivedEmotions: [
            Emotion(name: 'Inspirado', color: Colors.amber[200]!),
            Emotion(name: 'Receptivo', color: Colors.amber[200]!),
          ],
        ),
        Emotion(
          name: 'Íntimo',
          color: Colors.amber[400]!,
          derivedEmotions: [
            Emotion(name: 'Juguetón', color: Colors.amber[200]!),
            Emotion(name: 'Sensible', color: Colors.amber[200]!),
          ],
        ),
        Emotion(
          name: 'Pacífico',
          color: Colors.amber[400]!,
          derivedEmotions: [
            Emotion(name: 'Esperanzado', color: Colors.amber[200]!),
            Emotion(name: 'Amoroso', color: Colors.amber[200]!),
          ],
        ),
        Emotion(
          name: 'Poderoso',
          color: Colors.amber[400]!,
          derivedEmotions: [
            Emotion(name: 'Valiente', color: Colors.amber[200]!),
            Emotion(name: 'Provocativo', color: Colors.amber[200]!),
          ],
        ),
        Emotion(
          name: 'Aceptado',
          color: Colors.amber[400]!,
          derivedEmotions: [
            Emotion(name: 'Realizado', color: Colors.amber[200]!),
            Emotion(name: 'Respetado', color: Colors.amber[200]!),
          ],
        ),
        Emotion(
          name: 'Orgulloso',
          color: Colors.amber[400]!,
          derivedEmotions: [
            Emotion(name: 'Confiado', color: Colors.amber[200]!),
            Emotion(name: 'Importante', color: Colors.amber[200]!),
          ],
        ),
      ],
    ),
    Emotion(
      name: 'Sorpresa',
      color: Colors.blue,
      derivedEmotions: [
        Emotion(
          name: 'Jubiloso',
          color: Colors.blue[400]!,
          derivedEmotions: [
            Emotion(name: 'Eufórico', color: Colors.blue[200]!),
            Emotion(name: 'Liberado', color: Colors.blue[200]!),
          ],
        ),
        Emotion(
          name: 'Efusivo',
          color: Colors.blue[400]!,
          derivedEmotions: [
            Emotion(name: 'Enérgico', color: Colors.blue[200]!),
            Emotion(name: 'Inquieto', color: Colors.blue[200]!),
          ],
        ),
        Emotion(
          name: 'Asombrado',
          color: Colors.blue[400]!,
          derivedEmotions: [
            Emotion(name: 'Atónito', color: Colors.blue[200]!),
            Emotion(name: 'Pasmado', color: Colors.blue[200]!),
          ],
        ),
        Emotion(
          name: 'Confundido',
          color: Colors.blue[400]!,
          derivedEmotions: [
            Emotion(name: 'Perplejo', color: Colors.blue[200]!),
            Emotion(name: 'Desilusionado', color: Colors.blue[200]!),
          ],
        ),
        Emotion(
          name: 'Sorprendido',
          color: Colors.blue[400]!,
          derivedEmotions: [
            Emotion(name: 'Consternado', color: Colors.blue[200]!),
            Emotion(name: 'Impresionado', color: Colors.blue[200]!),
          ],
        ),
        Emotion(
          name: 'Interesado',
          color: Colors.blue[400]!,
          derivedEmotions: [
            Emotion(name: 'Curioso', color: Colors.blue[200]!),
            Emotion(name: 'Entretenido', color: Colors.blue[200]!),
          ],
        ),
      ],
    ),
    Emotion(
      name: 'Miedo',
      color: Colors.purple,
      derivedEmotions: [
        Emotion(
          name: 'Asustado',
          color: Colors.purple[400]!,
          derivedEmotions: [
            Emotion(name: 'Aterrado', color: Colors.purple[200]!),
            Emotion(name: 'Espantado', color: Colors.purple[200]!),
          ],
        ),
        Emotion(
          name: 'Inseguro',
          color: Colors.purple[400]!,
          derivedEmotions: [
            Emotion(name: 'Pobre', color: Colors.purple[200]!),
            Emotion(name: 'Inferior', color: Colors.purple[200]!),
          ],
        ),
        Emotion(
          name: 'Sumiso',
          color: Colors.purple[400]!,
          derivedEmotions: [
            Emotion(name: 'Indignado', color: Colors.purple[200]!),
            Emotion(name: 'Insignificante', color: Colors.purple[200]!),
          ],
        ),
        Emotion(
          name: 'Rechazado',
          color: Colors.purple[400]!,
          derivedEmotions: [
            Emotion(name: 'Inadecuado', color: Colors.purple[200]!),
            Emotion(name: 'Perturbado', color: Colors.purple[200]!),
          ],
        ),
        Emotion(
          name: 'Humillado',
          color: Colors.purple[400]!,
          derivedEmotions: [
            Emotion(name: 'Irrespetado', color: Colors.purple[200]!),
            Emotion(name: 'Ridiculizado', color: Colors.purple[200]!),
          ],
        ),
        Emotion(
          name: 'Herido',
          color: Colors.purple[400]!,
          derivedEmotions: [
            Emotion(name: 'Apenado', color: Colors.purple[200]!),
            Emotion(name: 'Devastado', color: Colors.purple[200]!),
          ],
        ),
      ],
    ),
  ];

  final List<Emotion> _selectedEmotions = [];

  List<Emotion> get emotions => [..._emotions];

  List<Emotion> get selectedEmotions => [..._selectedEmotions];

  Emotion findByName(String name) {
    Emotion? toFind;
    for (Emotion emotion in _emotions) {
      if (emotion.name == name) {
        toFind = emotion;
      } else {
        for (Emotion derived in emotion.derivedEmotions!) {
          if (derived.name == name) {
            toFind = derived;
          }
        }
      }

      if (toFind != null) {
        break;
      }
    }
    return toFind!;
  }

  List<Emotion> findListByName(String name) {
    Emotion? toFind;
    for (Emotion emotion in _emotions) {
      if (emotion.name == name) {
        toFind = emotion;
      } else {
        for (Emotion derived in emotion.derivedEmotions!) {
          if (derived.name == name) {
            toFind = derived;
          }
        }
      }

      if (toFind != null) {
        break;
      }
    }
    return toFind!.derivedEmotions!;
  }

  Emotion findParentByChildName(String name) {
    Emotion? toFind;
    for (Emotion emotion in _emotions) {
      if (emotion.name == name) {
        toFind = emotion;
      } else {
        for (Emotion derived in emotion.derivedEmotions!) {
          if (derived.name == name) {
            toFind = emotion;
          } else {
            for (Emotion specific in derived.derivedEmotions!) {
              if (specific.name == name) {
                toFind = derived;
              }
            }
          }
        }
      }

      if (toFind != null) {
        break;
      }
    }
    return toFind!;
  }

  void selectEmotion(String name, Color color) {
    final parentEmotion = findParentByChildName(name);
    final parentsParent = findParentByChildName(parentEmotion.name);

    var emotion = Emotion(name: name, color: color);

    if (emotion.name != parentEmotion.name) {
      emotion = Emotion(
        name: parentEmotion.name,
        color: parentEmotion.color,
        derivedEmotions: [emotion],
      );

      if (parentEmotion != parentsParent) {
        emotion = Emotion(
          name: parentsParent.name,
          color: parentsParent.color,
          derivedEmotions: [emotion],
        );
      }
    }

    //TODO: figure this out.
  }
}
