import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

import '../providers/posts.dart';
import '../widgets/main/moody_drawer.dart';

class CalendarScreen extends StatelessWidget {
  static const routeName = '/calendar-screen';

  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postsData = Provider.of<Posts>(context).items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Calendario'),
      ),
      drawer: const MoodyDrawer(),
      body: TableCalendar(
        calendarBuilders: CalendarBuilders(
          markerBuilder: (ctx, day, focusedDay) {
            double opacity = 0.0;
            int counter = 0;
            for (var p in postsData) {
              if (day.day == p.date.day && day.month == p.date.month) {
                counter++;
              }
            }
            if (counter > 0 && counter <= 2) {
              opacity = 0.2;
            }
            if (counter > 2 && counter < 4) {
              opacity = 0.6;
            }

            return Container(
              color: Colors.pink.withOpacity(opacity),
              child: Center(child: Text(day.day.toString())),
            );
          },
        ),
        locale: 'es_MX',
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 10, 16),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
