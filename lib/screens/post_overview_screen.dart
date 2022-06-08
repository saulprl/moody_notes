import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/posts.dart';
import '../widgets/main/text_area.dart';
import '../widgets/posts/post_list.dart';
import '../widgets/main/sort_button.dart';
import '../widgets/main/moody_drawer.dart';
import './filters_screen.dart';

class PostOverviewScreen extends StatelessWidget {
  const PostOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
        title: const Text('Moody Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_alt),
            onPressed: () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
      drawer: const MoodyDrawer(),
      body: FutureBuilder(
        future: Provider.of<Posts>(
          context,
          listen: false,
        ).fetchPosts(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextArea(),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            SortButton(),
                          ],
                        ),
                      ),
                      const PostList(),
                    ],
                  ),
      ),
    );
  }
}
