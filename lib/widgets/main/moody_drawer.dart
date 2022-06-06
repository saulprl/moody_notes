import 'package:flutter/material.dart';

import '../../screens/calendar_screen.dart';

class MoodyDrawer extends StatelessWidget {
  const MoodyDrawer({Key? key}) : super(key: key);

  Widget _buildButton(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

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
          _buildButton(
            'Inicio',
            Icons.home,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _buildButton(
            'Calendario',
            Icons.calendar_month,
            () => Navigator.of(context)
                .pushReplacementNamed(CalendarScreen.routeName),
          ),
        ],
      ),
    );
  }
}
