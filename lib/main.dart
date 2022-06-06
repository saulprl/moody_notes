import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import './providers/posts.dart';
import './providers/filters.dart';
import './providers/emotions.dart';
import './screens/filters_screen.dart';
import './screens/calendar_screen.dart';
import './screens/post_overview_screen.dart';
import './screens/basic_emotions_screen.dart';
import './screens/derived_emotions_screen.dart';
import './screens/post_details_tabs_screen.dart';
import './screens/specific_emotions_screen.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Filters(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Posts(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Emotions(),
        ),
      ],
      child: MaterialApp(
        title: 'Moody Notes',
        theme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Colors.pink[400]!,
            secondary: Colors.purple[200]!,
            background: Colors.grey[900]!,
            surface: Colors.grey[800]!,
            onPrimary: Colors.white,
          ),
          // .copyWith(
          //   primary: Colors.purple[800],
          //   secondary: Colors.pink[900],
          // ),
        ),
        home: const PostOverviewScreen(),
        routes: {
          PostDetailsTabsScreen.routeName: (ctx) =>
              const PostDetailsTabsScreen(),
          BasicEmotionsScreen.routeName: (ctx) => const BasicEmotionsScreen(),
          DerivedEmotionsScreen.routeName: (ctx) =>
              const DerivedEmotionsScreen(),
          SpecificEmotionsScreen.routeName: (ctx) =>
              const SpecificEmotionsScreen(),
          FiltersScreen.routeName: (ctx) => const FiltersScreen(),
          CalendarScreen.routeName: (ctx) => const CalendarScreen(),
        },
      ),
    );
  }
}
