import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

import '../providers/posts.dart';
import '../widgets/posts/post_list.dart';
import '../widgets/main/moody_drawer.dart';
import '../widgets/emotions/color_bullet.dart';

class CalendarScreen extends StatefulWidget {
  static const routeName = '/calendar-screen';

  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var _calendarFormat = CalendarFormat.month;
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late int _notesPerDay;
  var _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      _selectedDay = DateTime.now();
      _notesPerDay = Provider.of<Posts>(
        context,
        listen: false,
      ).countPosts(_selectedDay);
      _isInit = true;
    }
  }

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
                      color: _selectedDay == day
                          ? Colors.purple.withOpacity(opacity)
                          : Colors.pink.withOpacity(opacity),
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
            firstDay: DateTime.utc(2020, 8, 14),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            calendarFormat: _calendarFormat,
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (day, focusedDay) {
              setState(() {
                _selectedDay = day;
                _focusedDay = focusedDay;
                _notesPerDay = postsData.countPosts(day);
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            availableCalendarFormats: const {
              CalendarFormat.month: 'Mes',
              CalendarFormat.twoWeeks: 'Dos semanas',
              CalendarFormat.week: 'Semana',
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Notas del día: $_notesPerDay'),
                ),
                // ElevatedButton.icon(
                //   icon: const Icon(Icons.search),
                //   label: const Text('Buscar notas'),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          PostList(date: _selectedDay),
        ],
      ),
    );
  }
}
