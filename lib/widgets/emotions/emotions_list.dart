import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/emotion.dart';
import '../../providers/emotions.dart';
import 'emotion_item.dart';

class EmotionsList extends StatefulWidget {
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
  final void Function(String args)? onTap;
  final String? mainEmotion;

  const EmotionsList({
    Key? key,
    this.mainEmotion,
    this.onTap,
  }) : super(key: key);

  @override
  State<EmotionsList> createState() => _EmotionsListState();
}

class _EmotionsListState extends State<EmotionsList> {
  @override
  Widget build(BuildContext context) {
    final List<Emotion> emotions;
    final emotionsData = Provider.of<Emotions>(context);

    if (widget.mainEmotion != null) {
      emotions = emotionsData.findListByName(widget.mainEmotion!);
    } else {
      emotions = emotionsData.emotions;
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: emotions.length,
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: emotions[index],
          child: Column(
            children: [
              EmotionItem(
                key: ValueKey(emotions[index].name),
                onTap: widget.onTap,
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        );

        // emotions.map((emotion) {
        //   // var selected = emotion.isSelected;

        //   return Column(
        //     children: [
        //       EmotionItem(
        //         // title: emotion.name,
        //         // color: emotion.color,
        //         // selected: selected,
        //         onTap: widget.onTap,
        //       ),
        //       const SizedBox(height: 8.0),
        //     ],
        //   );
        // });
      },
    );
  }
}
