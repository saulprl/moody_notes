import 'package:flutter/material.dart';

import '../widgets/text_area.dart';
import '../widgets/post_list.dart';

class PostOverviewScreen extends StatelessWidget {
  const PostOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('anx'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextArea(),
          ),
          const Divider(),
          PostList(),
        ],
      ),
    );
  }
}
