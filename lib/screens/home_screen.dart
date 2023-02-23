import 'package:flutter/material.dart';
import 'package:media_player/screens/config_screen.dart';

import 'package:media_player/screens/music_list_screen.dart';
import 'package:media_player/screens/player_screen.dart';
import 'package:media_player/screens/playlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var bodywidget = homePlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("Music Player")),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                setState(() {
                  bodywidget = homePlayer();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Musicas"),
              onTap: () {
                setState(() {
                  bodywidget = const MusicListScreen();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Configuracoes"),
              onTap: () {
                setState(() {
                  bodywidget = const ConfigurationScreen();
                });
                Navigator.pop(context);
              },
            ),
            const ListTile(
              title: Text("Car Mode"),
            ),
          ],
        ),
      ),
      body: bodywidget,
    );
  }
}

Widget homePlayer() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        // MusicListScreen(),
        PlaylistScreen(),
        PlayerScreen(),
      ],
    ),
  );
}
// class Body extends StatelessWidget {
//   const Body({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           MusicListScreen(),
//           PlaylistScreen(),
//           PlayerScreen(),
//         ],
//       ),
//     );
//   }
// }
