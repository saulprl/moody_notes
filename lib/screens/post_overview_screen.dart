import 'package:flutter/material.dart';

import '../widgets/text_area.dart';
import '../widgets/post_list.dart';

class PostOverviewScreen extends StatelessWidget {
  const PostOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
        title: const Text('Moody Notes'),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextArea(),
          ),
          Divider(),
          PostList(),
        ],
      ),
    );
  }
}
