import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../providers/theme_preferences.dart';

import '../../screens/about_screen.dart';
import '../../screens/calendar_screen.dart';
import '../../screens/settings_screen.dart';

class MoodyDrawer extends StatelessWidget {
  const MoodyDrawer({Key? key}) : super(key: key);

  Widget _buildButton(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 22.0),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20.0),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemePreferences>(
      builder: (context, themeNotifier, child) => Drawer(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: const Text('Moody Notes'),
              actions: [
                IconButton(
                  icon: Icon(
                    themeNotifier.isDark ? Icons.light_mode : Icons.dark_mode,
                  ),
                  onPressed: () => themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true,
                ),
              ],
            ),
            // Container(
            //   height: 120,
            //   width: double.infinity,
            //   padding: const EdgeInsets.all(20.0),
            //   alignment: Alignment.centerLeft,
            //   child: const Text(
            //     'Moody Notes',
            //     style: TextStyle(fontSize: 30.0),
            //   ),
            // ),
            const SizedBox(height: 10.0),
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
            _buildButton(
              'Ajustes',
              Icons.settings,
              () => Navigator.of(context).pushNamed(SettingsScreen.routeName),
            ),
            _buildButton('Acerca de', Icons.info, () async {
              PackageInfo info = await PackageInfo.fromPlatform();
              Navigator.of(context).pushNamed(
                AboutScreen.routeName,
                arguments: info.version,
              );
            }),
          ],
        ),
      ),
    );
  }
}
