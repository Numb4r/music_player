import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_player/controllers/playlist_manager.dart';

enum statusPlayer { PLAY, STOP, PAUSED }

class MusicController extends ChangeNotifier {
  static final MusicController _instance = MusicController._internal();
  late AudioPlayer _audioPlayer;
  late statusPlayer status = statusPlayer.PAUSED;
  late ConcatenatingAudioSource playlist =
      ConcatenatingAudioSource(children: []);

  // TODO: salvar metodo shuffle no profile

  MusicController._internal() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.setAudioSource(playlist);
    //TODO: fetch previous playlist
    // playlist = ConcatenatingAudioSource(children: []);
  }

  factory MusicController() {
    return _instance;
  }

  changeStatus() {
    if (status == statusPlayer.PLAY) {
      pause();
    } else if (status == statusPlayer.PAUSED) {
      play();
    }
    notifyListeners();
  }

  addToPlaylist(String file) {
    playlist.add(AudioSource.file(file));
  }

  loadPlaylistSaved(int index) {
    // stop();
    playlist = PlaylistManager().getPlaylistByIndex(index);
    _audioPlayer.setAudioSource(playlist,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  setUniqueFile(String file) {
    _audioPlayer.setFilePath(file);
  }

  play() {
    _audioPlayer.play();
    status = statusPlayer.PLAY;
    notifyListeners();
  }

  pause() async {
    await _audioPlayer.pause();
    status = statusPlayer.PAUSED;
  }

  // stop() async {
  //   await _audioPlayer.stop();
  //   status = statusPlayer.STOP;
  // }

  seek(int seconds) async {
    await _audioPlayer.seek(Duration(seconds: seconds));
  }

  nextMusic() async {
    await _audioPlayer.seekToNext();
  }

  previousMusic() async {
    await _audioPlayer.seekToPrevious();
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    super.dispose();
  }
}
