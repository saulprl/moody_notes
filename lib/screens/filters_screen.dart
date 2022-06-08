import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/posts.dart';
import '../providers/filters.dart';
import '../providers/emotions.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitch(
    String title,
    bool switchValue,
    void Function(String name, bool val) updateValue,
  ) {
    return SwitchListTile(
      visualDensity: VisualDensity.compact,
      inactiveThumbColor: Colors.black26,
      title: Text(title),
      value: switchValue,
      tileColor: Provider.of<Emotions>(
        context,
        listen: false,
      ).getEmotionColor(title),
      activeColor: Colors.white,
      onChanged: (newValue) => setState(() {
        updateValue(title, newValue);
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtersData = Provider.of<Filters>(context);
    final postsData = Provider.of<Posts>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
        title: const Text('Filtros'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              try {
                await postsData.filterPosts(filtersData.filters);
              } catch (error) {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Error al filtrar'),
                    content: Text(
                        'Ocurrió un error durante el filtrado. Puedes reportar este problema con el desarrollador de la aplicación. Error: ${error.toString()}'),
                    actions: [
                      TextButton(
                        child: const Text('Ok'),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  'Emociones',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Expanded(
              child: ListView.builder(
                itemCount: filtersData.filters.length,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: _buildSwitch(
                    filtersData.filters[index].emotion,
                    filtersData.filters[index].value,
                    filtersData.toggleFilter,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: const Text('Limpiar filtros'),
                  onPressed: filtersData.filters.any((f) => f.value)
                      ? filtersData.clear
                      : null,
                ),
                ElevatedButton(
                  child: const Text('Guardar filtros'),
                  onPressed: () async {
                    try {
                      await postsData.filterPosts(filtersData.filters);
                    } catch (error) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Error al filtrar'),
                          content: Text(
                              'Ocurrió un error durante el filtrado. Puedes reportar este problema con el desarrollador de la aplicación. Error: ${error.toString()}'),
                          actions: [
                            TextButton(
                              child: const Text('Ok'),
                              onPressed: () => Navigator.of(ctx).pop(),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
