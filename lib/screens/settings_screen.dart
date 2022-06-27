import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/main/moody_drawer.dart';
import '../providers/post_date_preferences.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings-screen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Consumer<PostDatePreferences>(
          builder: (ctx, datePref, ch) => CheckboxListTile(
            title: const Text('Preguntar fecha de la nota'),
            subtitle: const Text(
                'Mostrar un selector de fecha para las notas guardadas.'),
            checkColor: Colors.white,
            activeColor: Theme.of(context).colorScheme.primary,
            value: datePref.askForDate,
            onChanged: (value) => datePref.askForDate = value!,
          ),
        ),
      ),
    );
  }
}
