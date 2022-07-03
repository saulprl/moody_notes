import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/post.dart';

import '../providers/posts.dart';
import '../providers/emotions.dart';

import '../screens/edit_text_screen.dart';
import '../screens/basic_emotions_screen.dart';

import '../widgets/posts/post_details_text.dart';
import '../widgets/posts/post_details_emotions_list.dart';

class PostDetailsTabsScreen extends StatefulWidget {
  static const routeName = '/post-details-tabs-screen';

  const PostDetailsTabsScreen({Key? key}) : super(key: key);

  @override
  State<PostDetailsTabsScreen> createState() => _PostDetailsTabsScreenState();
}

class _PostDetailsTabsScreenState extends State<PostDetailsTabsScreen> {
  late Posts _postsData;
  late Emotions _emotionsData;
  late List<Map<String, dynamic>> _screens;
  var _isInit = false;
  var _selectedScreenIndex = 0;
  String _postDate = '';
  late Post _post;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      _postsData = Provider.of<Posts>(context, listen: false);
      _emotionsData = Provider.of<Emotions>(context, listen: false);
      _initializeFields();
      _isInit = true;
    }
  }

  void _initializeFields() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      _post = _postsData
          .findById(ModalRoute.of(context)!.settings.arguments as String);
      _screens = [
        {
          'screen': PostDetailsText(_post),
          'title': 'Nota',
        },
        {
          'screen': PostDetailsEmotionsList(_post),
          'title': 'Emociones',
        },
      ];
      _postDate = DateFormat('MMM dd, yyyy', 'es_MX').format(_post.date);
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
          PopupMenuButton(
            itemBuilder: (ctx) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        'Editar ${_selectedScreenIndex == 0 ? 'texto' : 'emociones'}',
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_forever,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Eliminar nota',
                      ),
                    ],
                  ),
                ),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case 0:
                  switch (_selectedScreenIndex) {
                    case 0:
                      Navigator.of(context)
                          .pushNamed(
                            EditTextScreen.routeName,
                            arguments: _post,
                          )
                          .then(
                            (_) => setState(() {
                              _initializeFields();
                            }),
                          );
                      break;
                    case 1:
                      _emotionsData.selectFromList(_post.emotions);
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              const BasicEmotionsScreen(editMode: true),
                          settings: RouteSettings(arguments: _post),
                        ),
                      )
                          .then((value) {
                        if (value != null && value) {
                          setState(() {
                            _initializeFields();
                          });
                        }
                      });
                      break;
                  }
                  break;
                case 1:
                  showDialog<bool>(
                    context: context,
                    barrierDismissible: false,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Eliminar nota'),
                      content: const Text(
                        '¿Deseas eliminar esta nota? No podrás recuperarla.',
                      ),
                      actions: [
                        TextButton(
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                              color: Theme.of(ctx).colorScheme.secondary,
                            ),
                          ),
                          onPressed: () => Navigator.of(ctx).pop(false),
                        ),
                        TextButton(
                          child: const Text(
                            'Eliminar',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () => Navigator.of(ctx).pop(true),
                        ),
                      ],
                    ),
                  ).then((result) async {
                    if (result!) {
                      try {
                        await _postsData.deletePost(_post);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'La nota ha sido eliminada.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                        Navigator.of(context).pop();
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              error.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    }
                  });
                  break;
              }
            },
          ),
        ],
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
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
