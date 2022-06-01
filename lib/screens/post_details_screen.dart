import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/posts.dart';
import '../widgets/posts/post_item_emotions_list.dart';

class PostDetailsScreen extends StatelessWidget {
  static const routeName = '/post-detail';

  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedPost = Provider.of<Posts>(context).findById(id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Texto de la nota',
                  style: TextStyle(fontSize: 22.0),
                ),
                Text(
                  DateFormat('yyyy-MM-dd').format(selectedPost.date),
                  style: const TextStyle(fontSize: 22.0),
                ),
              ],
            ),
            const Divider(),
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    selectedPost.text,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Emociones',
                  style: TextStyle(fontSize: 22.0),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              flex: 1,
              child: PostItemEmotionsList(selectedPost.emotions),
            ),
          ],
        ),
      ),
    );
  }
}
