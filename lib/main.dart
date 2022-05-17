import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/posts.dart';
import './screens/post_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Posts(),
      child: MaterialApp(
        title: 'anx',
        theme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Colors.purple[200]!,
            secondary: Colors.pink,
          ),
          // .copyWith(
          //   primary: Colors.purple[800],
          //   secondary: Colors.pink[900],
          // ),
        ),
        home: const PostOverviewScreen(),
      ),
    );
  }
}
