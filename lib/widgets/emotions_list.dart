import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/emotion.dart';
import '../providers/emotions.dart';
import './emotion_item.dart';

class EmotionsList extends StatelessWidget {
  // final Map<String, Map<String, List<String>>> _emotions = const {
  //   'Ira': {
  //     'Amenazado': ['Inseguro', 'Celoso'],
  //     'Odioso': ['Resentido', 'Violado'],
  //     'Desquiciado': ['Enfurecido', 'Rabioso'],
  //     'Agresivo': ['Provocado', 'Hostil'],
  //     'Frustrado': ['Enfadado', 'Irritado'],
  //     'Distante': ['Retirado', 'Sospechoso'],
  //   },
  //   'Disgusto': {
  //     'Crítico': ['Sarcástico', 'Escéptico'],
  //     'Desaprobado': ['Sentencioso', 'Aborrecido'],
  //     'Decepcionado': ['Repugnante', 'Rebelado'],
  //     'Terrible': ['Repulsivo', 'Detestable'],
  //     'Evasivo': ['Aversivo', 'Indeciso'],
  //     'Culpable': ['Atormentado', 'Avergonzado'],
  //   },
  //   'Tristeza': {
  //     'Ansioso': ['Anhelante', 'Abrumado'],
  //     'Abandonado': ['Ignorado', 'Discriminado'],
  //     'Desesperado': ['Impotente', 'Vulnerable'],
  //     'Deprimido': ['Inferior', 'Vacío'],
  //     'Solitario': ['Abandonado', 'Apartado'],
  //     'Aburrido': ['Apático', 'Indiferente'],
  //   },
  //   'Felicidad': {
  //     'Optimista': ['Inspirado', 'Receptivo'],
  //     'Íntimo': ['Juguetón', 'Sensible'],
  //     'Pacífico': ['Esperanzado', 'Amoroso'],
  //     'Poderoso': ['Provocativo', 'Valiente'],
  //     'Aceptado': ['Respetado', 'Realizado'],
  //     'Orgulloso': ['Importante', 'Confiado'],
  //   },
  //   'Sorpresa': {
  //     'Jubiloso': ['Eufórico', 'Liberado'],
  //     'Efusivo': ['Enérgico', 'Inquieto'],
  //     'Asombrado': ['Atónito', 'Pasmado'],
  //     'Confundido': ['Perplejo', 'Desilusionado'],
  //     'Sorprendido': ['Impresionado', 'Consternado'],
  //     'Interesado': ['Entretenido', 'Curioso'],
  //   },
  //   'Miedo': {
  //     'Asustado': ['Espantado', 'Aterrado'],
  //     'Inseguro': ['Inferior', 'Pobre'],
  //     'Sumiso': ['Insignificante', 'Indignado'],
  //     'Rechazado': ['Inadecuado', 'Perturbado'],
  //     'Humillado': ['Irrespetado', 'Ridiculizado'],
  //     'Herido': ['Apenado', 'Devastado'],
  //   },
  // };

  // final _basicEmotions = const {
  //   'Ira': Colors.red,
  //   'Disgusto': Colors.orange,
  //   'Tristeza': Colors.green,
  //   'Felicidad': Colors.amber,
  //   'Sorpresa': Colors.blue,
  //   'Miedo': Colors.purple,
  // };
  void Function(String args)? onTap;
  String? mainEmotion;
  void Function(
    String name,
    bool remove,
    List<Emotion>? derived,
  )? updateEmotions;

  EmotionsList({
    Key? key,
    this.mainEmotion,
    this.onTap,
    this.updateEmotions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Emotion> emotions;
    final emotionsData = Provider.of<Emotions>(context, listen: false);

    if (mainEmotion != null) {
      emotions = emotionsData.findListByName(mainEmotion!);
    } else {
      emotions = emotionsData.emotions;
    }

    return ListView(
      shrinkWrap: true,
      children: emotions.map((emotion) {
        var selected = false;

        return Column(
          children: [
            EmotionItem(
              title: emotion.name,
              color: emotion.color,
              selected: selected,
              onTap: onTap,
              updateEmotions: updateEmotions,
            ),
            const SizedBox(height: 8.0),
          ],
        );
      }).toList(),
    );
  }
}
