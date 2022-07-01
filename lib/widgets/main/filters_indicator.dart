import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/filter.dart';

import '../../providers/filters.dart';

class FiltersIndicator extends StatefulWidget {
  const FiltersIndicator({Key? key}) : super(key: key);

  @override
  State<FiltersIndicator> createState() => _FiltersIndicatorState();
}

class _FiltersIndicatorState extends State<FiltersIndicator> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Filters>(
      builder: (ctx, filtersData, child) {
        var counter = 0;
        for (Filter f in filtersData.filters) {
          if (f.value) {
            counter++;
          }
        }
        if (counter == 0) {
          return child!;
        } else {
          return Text(
            counter > 1 ? '$counter filtros activos' : '$counter filtro activo',
          );
        }
      },
      child: const Text(''),
    );
  }
}
