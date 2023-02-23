import 'package:flutter/material.dart';
import 'package:media_player/controllers/music_controller.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var status = context.watch<MusicController>().status;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {
              context.read<MusicController>().previousMusic();
            },
            icon: Icon(Icons.arrow_back)),
        IconButton(
          onPressed: () {
            context.read<MusicController>().changeStatus();
          },
          icon: status == statusPlayer.PAUSED
              ? Icon(Icons.play_arrow)
              : Icon(Icons.pause),
        ),
        IconButton(
            onPressed: () {
              context.read<MusicController>().nextMusic();
            },
            icon: Icon(Icons.arrow_forward)),
      ],
    );
  }
}
