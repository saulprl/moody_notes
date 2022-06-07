import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

import '../providers/posts.dart';
import '../widgets/main/moody_drawer.dart';
import '../widgets/emotions/color_bullet.dart';

class CalendarScreen extends StatelessWidget {
  static const routeName = '/calendar-screen';

  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postsData = Provider.of<Posts>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Calendario'),
      ),
      drawer: const MoodyDrawer(),
      body: Column(
        children: [
          TableCalendar(
            onFormatChanged: (format) {},
            calendarBuilders: CalendarBuilders(
              markerBuilder: (ctx, day, focusedDay) {
                final opacity = postsData.calculateOpacity(day);
                final colors = postsData.getEmotionsPerDay(day);
                List<ColorBullet> bullets = [];
                for (Color c in colors) {
                  bullets.add(ColorBullet(c));
                }

                return Stack(
                  children: [
                    Container(
                      color: Colors.pink.withOpacity(opacity),
                      child: Center(child: Text(day.day.toString())),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: bullets,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            locale: 'es_MX',
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 10, 16),
            focusedDay: DateTime.now(),
          ),
        ],
      ),
    );
  }
}
