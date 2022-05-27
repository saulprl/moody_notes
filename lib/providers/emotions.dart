import 'package:flutter/material.dart';

import 'emotion.dart';

class Emotions with ChangeNotifier {
  final List<Emotion> _emotions = [
    Emotion(
      id: 1,
      name: 'Ira',
      color: Colors.red,
      derivedEmotions: [
        Emotion(
          id: 10,
          name: 'Amenazado',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(id: 100, name: 'Inseguro', color: Colors.red[200]!),
            Emotion(id: 101, name: 'Celoso', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          id: 11,
          name: 'Odioso',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(id: 110, name: 'Resentido', color: Colors.red[200]!),
            Emotion(id: 111, name: 'Violado', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          id: 12,
          name: 'Desquiciado',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(id: 120, name: 'Enfurecido', color: Colors.red[200]!),
            Emotion(id: 121, name: 'Rabioso', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          id: 13,
          name: 'Agresivo',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(id: 130, name: 'Provocado', color: Colors.red[200]!),
            Emotion(id: 131, name: 'Hostil', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          id: 14,
          name: 'Frustrado',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(id: 140, name: 'Enfadado', color: Colors.red[200]!),
            Emotion(id: 141, name: 'Irritado', color: Colors.red[200]!),
          ],
        ),
        Emotion(
          id: 15,
          name: 'Distante',
          color: Colors.red[400]!,
          derivedEmotions: [
            Emotion(id: 150, name: 'Retirado', color: Colors.red[200]!),
            Emotion(id: 151, name: 'Sospechoso', color: Colors.red[200]!),
          ],
        ),
      ],
    ),
    Emotion(
      id: 2,
      name: 'Disgusto',
      color: Colors.orange,
      derivedEmotions: [
        Emotion(
          id: 20,
          name: 'Crítico',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(id: 200, name: 'Sarcástico', color: Colors.orange[200]!),
            Emotion(id: 201, name: 'Escéptico', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          id: 21,
          name: 'Desaprobado',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(id: 210, name: 'Sentencioso', color: Colors.orange[200]!),
            Emotion(id: 211, name: 'Aborrecido', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          id: 22,
          name: 'Decepcionado',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(id: 220, name: 'Repugnante', color: Colors.orange[200]!),
            Emotion(id: 221, name: 'Rebelado', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          id: 23,
          name: 'Terrible',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(id: 230, name: 'Repulsivo', color: Colors.orange[200]!),
            Emotion(id: 231, name: 'Detestable', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          id: 24,
          name: 'Evasivo',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(id: 240, name: 'Aversivo', color: Colors.orange[200]!),
            Emotion(id: 241, name: 'Indeciso', color: Colors.orange[200]!),
          ],
        ),
        Emotion(
          id: 25,
          name: 'Culpable',
          color: Colors.orange[400]!,
          derivedEmotions: [
            Emotion(id: 250, name: 'Atormentado', color: Colors.orange[200]!),
            Emotion(id: 251, name: 'Avergonzado', color: Colors.orange[200]!),
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

  void _selectParents(Emotion selected) {
    if (_emotions.contains(selected)) {
      selected.setSelected(true);
    } else {
      for (Emotion basic in _emotions) {
        if (basic.derivedEmotions!.contains(selected)) {
          basic.setSelected(true);
          selected.setSelected(true);
        } else {
          for (Emotion derived in basic.derivedEmotions!) {
            if (derived.derivedEmotions!.contains(selected)) {
              basic.setSelected(true);
              derived.setSelected(true);
              selected.setSelected(true);
            }
          }
        }
      }
    }
  }

  void _deselectChildren(List<Emotion>? derived) {
    if (derived != null) {
      for (Emotion emotion in derived) {
        emotion.setSelected(false);
        if (emotion.derivedEmotions != null) {
          _deselectChildren(emotion.derivedEmotions!);
        }
      }
    }
  }

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

  bool isSelected(String name, Color color) {
    for (Emotion basic in _selectedEmotions) {
      if (basic.name == name && basic.color == color) {
        return true;
      } else {
        for (Emotion derived in basic.derivedEmotions!) {
          if (derived.name == name && derived.color == color) {
            return true;
          } else {
            for (Emotion specific in derived.derivedEmotions!) {
              if (specific.name == name && specific.color == color) {
                return true;
              }
            }
          }
        }
      }
    }
    return false;
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

  Emotion? findParentByChildName(String name, Color color, int tier) {
    Emotion? toFind;
    for (Emotion emotion in _emotions) {
      if (emotion.name == name && emotion.color == color) {
        toFind = Emotion(name: emotion.name, color: emotion.color);
        break;
      } else {
        for (Emotion derived in emotion.derivedEmotions!) {
          if (derived.name == name && derived.color == color && tier == 1) {
            toFind = Emotion(name: emotion.name, color: emotion.color);
            break;
          } else if (derived.name == name &&
              derived.color == color &&
              tier == 2) {
            toFind = Emotion(name: derived.name, color: derived.color);
            break;
          } else if (derived.name == name &&
              derived.color == color &&
              tier == 3) {
            toFind = Emotion(name: derived.name, color: derived.color);
            break;
          } else {
            for (Emotion specific in derived.derivedEmotions!) {
              if (specific.name == name &&
                  specific.color == color &&
                  tier == 1) {
                toFind = Emotion(name: emotion.name, color: emotion.color);
                break;
              } else if (specific.name == name &&
                  specific.color == color &&
                  tier == 2) {
                toFind = Emotion(name: derived.name, color: derived.color);
                break;
              } else if (specific.name == name &&
                  specific.color == color &&
                  tier == 3) {
                toFind = Emotion(name: specific.name, color: specific.color);
                break;
              }
            }
          }
        }
      }

      // if (toFind != null) {
      //   break;
      // }
    }
    return toFind;
  }

  // void selectEmotion(String name, Color color) {
  //   final basicEmotion = findParentByChildName(name, color, 1);
  //   final derivedEmotion = findParentByChildName(name, color, 2);
  //   final specificEmotion = findParentByChildName(name, color, 3);

  //   if (specificEmotion!.name != derivedEmotion!.name &&
  //       derivedEmotion.name != basicEmotion!.name) {
  //     derivedEmotion.derivedEmotions = [specificEmotion];
  //     basicEmotion.derivedEmotions = [derivedEmotion];
  //     _selectedEmotions.add(basicEmotion);
  //     notifyListeners();
  //   }
  // }

  bool hasSelected() {
    return _emotions.any((emotion) => emotion.isSelected);
  }

  void setSelected(Emotion selected, bool value) {
    if (value) {
      _selectParents(selected);
    } else {
      selected.setSelected(value);
      _deselectChildren(selected.derivedEmotions);
    }
  }

  List<Emotion>? _fetchSelectedDerivedEmotions(Emotion emotion) {
    List<Emotion>? selected;
    if (emotion.derivedEmotions != null) {
      for (Emotion derived in emotion.derivedEmotions!) {
        if (derived.isSelected) {
          selected ??= [];

          Emotion derivedCopy = Emotion(
            name: derived.name,
            color: derived.color,
            isSelected: true,
          );
          selected.add(derivedCopy);
          derivedCopy.derivedEmotions = _fetchSelectedDerivedEmotions(derived);
        }
      }
    }
    return selected;
  }

  void fetchSelectedEmotions() {
    for (Emotion emotion in _emotions) {
      if (emotion.isSelected) {
        Emotion emotionCopy = Emotion(
          name: emotion.name,
          color: emotion.color,
          isSelected: true,
        );
        emotionCopy.derivedEmotions = _fetchSelectedDerivedEmotions(emotion);
        _selectedEmotions.add(emotionCopy);
      }
    }
  }
}
