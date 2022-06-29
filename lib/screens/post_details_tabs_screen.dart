import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
  String _postDate = '';
  var _editMode = false;

  @override
  void initState() {
    super.initState();
  }

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
            'title': 'Nota',
          },
          {
            'screen': PostDetailsEmotionsList(post.emotions),
            'title': 'Emociones',
          },
        ];
        _postDate = DateFormat('MMM dd, yyyy', 'es_MX').format(post.date);
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_screens[_selectedScreenIndex]['title'] as String),
            Text(_postDate),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_editMode ? Icons.save : Icons.edit),
            onPressed: () {},
          ),
        ],
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
