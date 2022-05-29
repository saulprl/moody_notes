import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/posts.dart';
import './post_item.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<Posts>(
        child: const Center(
          child: Text('Aún no hay notas - ¡Empieza a escribir algunas!'),
        ),
        builder: (ctx, postsData, ch) => postsData.items.isEmpty
            ? ch!
            : ListView.builder(
                shrinkWrap: true,
                itemCount: postsData.items.length,
                itemBuilder: (ctx, index) => PostItem(postsData.items[index]),
              ),
      ),
    );
  }
}
