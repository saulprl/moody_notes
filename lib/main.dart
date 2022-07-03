import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import './providers/posts.dart';
import './providers/filters.dart';
import './providers/emotions.dart';
import './providers/theme_preferences.dart';
import './providers/post_date_preferences.dart';

import './screens/about_screen.dart';
import './screens/filters_screen.dart';
import './screens/calendar_screen.dart';
import './screens/settings_screen.dart';
import './screens/edit_text_screen.dart';
import './screens/post_overview_screen.dart';
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
    var darkScheme = ColorScheme.dark(
      primary: Colors.pink[400]!,
      secondary: Colors.purple[300]!,
      background: Colors.grey[900]!,
      onPrimary: Colors.white,
      surface: Colors.grey[800]!,
      surfaceVariant: Colors.black,
      // onSurface: Colors.grey[600]!,
      onBackground: Colors.white,
      error: Colors.red,
    );
    var lightScheme = ColorScheme.light(
      primary: Colors.pink[400]!,
      secondary: Colors.deepPurple,
      background: Colors.white,
      onPrimary: Colors.white,
      surface: Colors.grey[200]!,
      surfaceVariant: Colors.grey[300],
      // onSurface: Colors.black,
      onBackground: Colors.grey[800]!,
      error: Colors.red,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemePreferences(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PostDatePreferences(),
        ),
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
      child: Consumer<ThemePreferences>(
        builder: (context, themeProvider, ch) => MaterialApp(
          title: 'Moody Notes',
          theme: ThemeData(
            scaffoldBackgroundColor: themeProvider.isDark
                ? darkScheme.background
                : lightScheme.background,
            colorScheme: themeProvider.isDark ? darkScheme : lightScheme,
            appBarTheme: AppBarTheme(
              elevation: 3.0,
              backgroundColor: Colors.pink[400]!,
            ),
            shadowColor:
                themeProvider.isDark ? Colors.grey[900] : Colors.grey[600],
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  themeProvider.isDark ? Colors.white : Colors.black,
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: themeProvider.isDark ? Colors.white : Colors.black,
                  ),
                ),
                splashFactory: NoSplash.splashFactory,
                visualDensity: VisualDensity.compact,
              ),
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
            EditTextScreen.routeName: (ctx) => const EditTextScreen(),
            DerivedEmotionsScreen.routeName: (ctx) =>
                const DerivedEmotionsScreen(),
            SpecificEmotionsScreen.routeName: (ctx) =>
                const SpecificEmotionsScreen(),
            FiltersScreen.routeName: (ctx) => const FiltersScreen(),
            CalendarScreen.routeName: (ctx) => const CalendarScreen(),
            SettingsScreen.routeName: (ctx) => const SettingsScreen(),
            AboutScreen.routeName: (ctx) => const AboutScreen(),
          },
        ),
      ),
    );
  }
}
