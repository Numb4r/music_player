import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:media_player/controllers/route_manager.dart';
import 'package:media_player/models/profile.dart';
import 'package:provider/provider.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = ;
    return Center(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: !context.watch<Profile>().isDarkMode,
              onChanged: (value) => {
                context.read<Profile>().changeDarkMode(),
                if (value)
                  {AdaptiveTheme.of(context).setLight()}
                else
                  {AdaptiveTheme.of(context).setDark()},
              },
            ),
          ),
          ListTile(
            title: const Text("Gerenciar pastas"),
            onTap: () {
              Navigator.of(context).pushNamed(RouteManager.folderManagerPage);
            },
          )
        ],
      ),
    );
  }
}
