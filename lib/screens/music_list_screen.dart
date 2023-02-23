import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:media_player/controllers/music_controller.dart';
import 'package:media_player/models/profile.dart';
import 'package:provider/provider.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var musics = context.watch<Profile>().music;
    return musics.isEmpty
        ? const Center(
            child: Text("Sem musicas"),
          )
        : ListView.builder(
            itemCount: musics.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(musics[index]),
                onTap: () {
                  context.read<MusicController>().addToPlaylist(musics[index]);
                  // context.read<MusicController>().setUniqueFile(musics[index]);
                  // context.read<MusicController>().play();
                  // MusicController().play();
                },
              );
            });
  }
}
