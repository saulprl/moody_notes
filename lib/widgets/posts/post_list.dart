import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/posts.dart';
import './post_item.dart';

class PostList extends StatelessWidget {
  final DateTime? date;

  const PostList({this.date, Key? key}) : super(key: key);

  Future<void> _fetch(BuildContext ctx) async {
    try {
      await Provider.of<Posts>(
        ctx,
        listen: false,
      ).fetchPosts();
    } catch (error) {
      showDialog(
        context: ctx,
        builder: (ct) => AlertDialog(
          title: const Text('Error durante la consulta'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(ct).pop(),
            ),
          ],
        ),
      );
    }
  }

  Widget _postListBuilder() {
    return Expanded(
      child: Consumer<Posts>(
        child: const Center(
          child: Text('Aún no hay notas - ¡Empieza a escribir algunas!'),
        ),
        builder: (ctx, postsData, ch) {
          if (date != null) {
            final postsOnDate = postsData.items
                .where((p) =>
                    p.date.day == date!.day &&
                    p.date.month == date!.month &&
                    p.date.year == date!.year)
                .toList();

            return postsOnDate.isEmpty
                ? const Center(
                    child:
                        Text('No hay notas escritas en el día seleccionado.'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: postsOnDate.length,
                    itemBuilder: (ctx, index) => PostItem(postsOnDate[index]),
                  );
          } else {
            return postsData.items.isEmpty
                ? ch!
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: postsData.items.length,
                    itemBuilder: (ctx, index) =>
                        PostItem(postsData.items[index]),
                  );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return date == null
        ? FutureBuilder(
            future: _fetch(context),
            builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : _postListBuilder())
        : _postListBuilder();
  }
}
