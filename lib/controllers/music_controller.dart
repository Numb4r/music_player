import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_player/models/playlist_manager.dart';

enum statusPlayer { PLAY, STOP, PAUSED }

enum shuffleType { OFF, ONE, ALL }

class MusicController extends ChangeNotifier {
  static final MusicController _instance = MusicController._internal();
  late AudioPlayer _audioPlayer;
  late statusPlayer status = statusPlayer.PAUSED;
  // TODO: salvar metodo shuffle no profile
  late shuffleType shuffleStatus;
  late ConcatenatingAudioSource _playlist;
  MusicController._internal() {
    _audioPlayer = AudioPlayer();
    //TODO: fetch previous playlist
    _playlist = ConcatenatingAudioSource(children: []);
  }

  factory MusicController() {
    return _instance;
  }
  addToPlaylist(String file) {
    _playlist.add(AudioSource.file(file));
  }

  loadPlaylistSaved(int index) {
    stop();
    _playlist = PlaylistManager().getPlaylistByIndex(index);
    _audioPlayer.setAudioSource(_playlist,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  setUniqueFile(String file) {
    _audioPlayer.setFilePath(file);
  }

  play() async {
    await _audioPlayer.play();
    status = statusPlayer.PLAY;
    notifyListeners();
  }

  pause() async {
    await _audioPlayer.pause();
    status = statusPlayer.PAUSED;
    notifyListeners();
  }

  stop() async {
    await _audioPlayer.stop();
    status = statusPlayer.STOP;
    notifyListeners();
  }

  seek(int seconds) async {
    await _audioPlayer.seek(Duration(seconds: seconds));
  }

  nextMusic() async {
    await _audioPlayer.seekToNext();
  }

  previousMusic() async {
    await _audioPlayer.seekToPrevious();
  }
}
