import 'package:flutter/material.dart';
import 'package:media_player/fragments/template_menu.dart';
import 'package:media_player/models/profile.dart';
import 'package:media_player/screens/config_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateMenu(body: Body());
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          ListTile(
              title: const Text("Dark Mode"),
              trailing: TextButton(
                child: Text(context.watch<Profile>().isDarkMode
                    ? "Dark Mode"
                    : " light mode"),
                onPressed: () {
                  context.read<Profile>().changeDarkMode();
                  print(
                      Provider.of<Profile>(context, listen: false).isDarkMode);
                },
              )
              // trailing: Switch(
              //   value: isDarkMode,
              //   onChanged: (_) => {
              //     context.read<Profile>().changeDarkMode(),
              //     isDarkMode = !isDarkMode,
              //     if (isDarkMode)
              //       {AdaptiveTheme.of(context).setLight()}
              //     else
              //       {AdaptiveTheme.of(context).setDark()},
              //     print(context.watch<Profile>().isDarkMode)
              //   },
              // ),
              )
        ],
      ),
    );
  }
}
