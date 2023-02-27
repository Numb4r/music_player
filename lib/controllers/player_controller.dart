import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_player/controllers/playlist_manager.dart';
import 'package:media_player/models/music.dart';

import 'package:media_player/models/playlist.dart';

enum statusPlayer { PLAY, STOP, PAUSED }

class PlayerController extends ChangeNotifier {
  static final PlayerController _instance = PlayerController._internal();
  late AudioPlayer _audioPlayer;
  late statusPlayer status = statusPlayer.PAUSED;
  Playlist currentPaylist = Playlist();
  ConcatenatingAudioSource currentSource =
      ConcatenatingAudioSource(children: []);

  // TODO: salvar metodo shuffle no profile

  PlayerController._internal() {
    _audioPlayer = AudioPlayer();

    // TODO: fetch previous currentPlaylist
    // currentSource = ConcatenatingAudioSource(children: []);
    _audioPlayer.setAudioSource(currentSource);
  }

  factory PlayerController() {
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

  addToPlaylist(Music music) {
    currentPaylist.musics.add(music);
    currentSource.add(AudioSource.file(music.path));
    notifyListeners();
  }

  loadPlaylistSaved(int index) {
    // stop();
    // currentPlaylist = PlaylistManager().getPlaylistByIndex(index);
    // _audioPlayer.setAudioSource(currentPlaylist,
    //     initialIndex: 0, initialPosition: Duration.zero);
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
