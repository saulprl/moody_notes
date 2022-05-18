import 'package:flutter/material.dart';

class PostDetailsScreen extends StatelessWidget {
  static const routeName = '/post-detail';

  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Nota'),
      ),
      body: const Center(
        child: Text('Detalles'),
      ),
    );
  }
}
