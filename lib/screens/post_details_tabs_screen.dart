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
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _selectedScreenIndex == 0
                ? () {
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
                  }
                : () {
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
                    // Navigator.of(context)
                    //     .pushNamed(BasicEmotionsScreen.routeName)
                    //     .then(
                    //   (_) async {
                    //     // Función que espera a que se terminen de editar las emociones.
                    //     await _postsData.updatePost(
                    //       Post(
                    //         id: _post.id,
                    //         text: _post.text,
                    //         emotions: _emotionsData.selectedEmotions,
                    //         date: _post.date,
                    //       ),
                    //     ); // La app espera a que los cambios terminen de guardarse.
                    //     setState(() {
                    //       _initializeFields(); // Se actualiza la interfaz con los nuevos cambios.
                    //     });
                    //   },
                    // );
                  },
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
