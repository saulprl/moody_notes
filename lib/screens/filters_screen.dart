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
  late Filters _filtersData;
  late Posts _postsData;

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
  void dispose() {
    _postsData.filterPosts(_filtersData.filters);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _filtersData = Provider.of<Filters>(context);
    _postsData = Provider.of<Posts>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
        // actions: [
        // IconButton(
        //   icon: const Icon(Icons.save),
        //   onPressed: () async {
        //     try {
        //       await _postsData.filterPosts(_filtersData.filters);
        //     } catch (error) {
        //       showDialog(
        //         context: context,
        //         builder: (ctx) => AlertDialog(
        //           title: const Text('Error al filtrar'),
        //           content: Text(
        //               'Ocurrió un error durante el filtrado. Puedes reportar este problema con el desarrollador de la aplicación. Error: ${error.toString()}'),
        //           actions: [
        //             TextButton(
        //               child: const Text('Ok'),
        //               onPressed: () => Navigator.of(ctx).pop(),
        //             ),
        //           ],
        //         ),
        //       );
        //     }
        //   },
        // ),
        // ],
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
                itemCount: _filtersData.filters.length,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: _buildSwitch(
                    _filtersData.filters[index].emotion,
                    _filtersData.filters[index].value,
                    _filtersData.toggleFilter,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: const Text('Limpiar filtros'),
                  onPressed: _filtersData.filters.any((f) => f.value)
                      ? _filtersData.clear
                      : null,
                ),
                // ElevatedButton(
                //   child: const Text('Guardar filtros'),
                //   onPressed: () async {
                //     try {
                //       await _postsData.filterPosts(_filtersData.filters);
                //     } catch (error) {
                //       showDialog(
                //         context: context,
                //         builder: (ctx) => AlertDialog(
                //           title: const Text('Error al filtrar'),
                //           content: Text(
                //               'Ocurrió un error durante el filtrado. Puedes reportar este problema con el desarrollador de la aplicación. Error: ${error.toString()}'),
                //           actions: [
                //             TextButton(
                //               child: const Text('Ok'),
                //               onPressed: () => Navigator.of(ctx).pop(),
                //             ),
                //           ],
                //         ),
                //       );
                //     }
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
