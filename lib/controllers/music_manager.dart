import 'dart:io';

import 'package:flutter/material.dart';
import 'package:media_player/models/music.dart';
import 'package:media_player/models/profile.dart';

class MusicManager extends ChangeNotifier {
  static final MusicManager _instance = MusicManager._internal();
  factory MusicManager() {
    return _instance;
  }
  MusicManager._internal();
  List<Music> musics = [];
  Set<String> paths = {};
  addMusic(String name, String path) {
    musics.add(Music(name: name, path: path));
  }

  removeMusicFromPath(String path) {
    musics.removeWhere((element) => element.path == path);
  }

  addFolder(String path) {
    if (!paths.contains(path)) {
      Profile().addMediaFolder(path);
      paths.add(path);
      fetch(path);
      notifyListeners();
    }
  }

  removeFolder(String path) {
    paths.remove(path);
    removeMusicFromPath(path);
    Profile().removeMediaFolder(path);
    notifyListeners();
  }

  removeFolderByIndex(int index) {
    var path = paths.elementAt(index);
    paths.remove(path);
    removeMusicFromPath(path);
    Profile().removeMediaFolderByIndex(index);

    notifyListeners();
  }

  fetch(String pathFolder) {
    var dir = Directory(pathFolder);
    List content = dir.listSync(recursive: true);
    for (var file in content) {
      if (file is File) {
        addMusic(file.path.split('/').last, file.path);
      }
    }
  }

  init(List<String> folders) {
    for (var path in folders) {
      fetch(path);
      folders.add(path);
    }
    notifyListeners();
  }
}
