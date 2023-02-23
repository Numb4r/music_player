import 'package:just_audio/just_audio.dart';

class Playlist {
  Playlist({required name, ConcatenatingAudioSource? playlist});
  late String name;
  String description = '';
  late ConcatenatingAudioSource playlist;
}
