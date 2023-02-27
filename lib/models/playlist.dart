import 'package:just_audio/just_audio.dart';
import 'package:media_player/models/music.dart';

class Playlist {
  Playlist({name});
  String name = '';
  String description = '';
  // late ConcatenatingAudioSource playlist;
  late List<Music> musics = [];
}
