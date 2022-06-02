import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/posts.dart';
import '../widgets/posts/post_details_text.dart';
import '../widgets/posts/post_details_emotions_list.dart';

class PostDetailsTabsScreen extends StatefulWidget {
  static const routeName = '/post-details-tabs-screen';

  const PostDetailsTabsScreen({Key? key}) : super(key: key);

  @override
  State<PostDetailsTabsScreen> createState() => _PostDetailsTabsScreenState();
}

class _PostDetailsTabsScreenState extends State<PostDetailsTabsScreen> {
  late List<Map<String, dynamic>> _screens;
  var _isInit = false;
  var _selectedScreenIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        final post = Provider.of<Posts>(
          context,
          listen: false,
        ).findById(ModalRoute.of(context)!.settings.arguments as String);
        _screens = [
          {
            'screen': PostDetailsText(post),
            'title': 'Texto de la nota',
          },
          {
            'screen': PostDetailsEmotionsList(post.emotions),
            'title': 'Emociones de la nota',
          },
        ];
      }
      _isInit = true;
    }
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        onTap: _selectScreen,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: 'Texto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied_alt),
            label: 'Emociones',
          ),
        ],
      ),
    );
  }
}
