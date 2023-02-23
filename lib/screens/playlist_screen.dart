import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:media_player/controllers/music_controller.dart';
import 'package:media_player/models/profile.dart';
import 'package:provider/provider.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var playlist = context.watch<MusicController>().playlist.children;

    // var playlist = context.watch<Profile>().music;
    return playlist.isEmpty
        ? const Center(child: Text("Playlist vazia"))
        : Expanded(
            child: ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(index.toString()),
                  onTap: () {},
                );
              },
            ),
          );
  }
}
