import 'package:flutter/material.dart';

class MoodyDrawer extends StatelessWidget {
  const MoodyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Moody Notes',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
