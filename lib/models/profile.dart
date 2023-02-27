import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:media_player/controllers/music_manager.dart';
import 'package:media_player/controllers/player_controller.dart';
import 'package:media_player/models/music.dart';

class Profile extends ChangeNotifier {
  static final Profile _instance = Profile._internal();
  var _box;

  List<String> folders = [];
  // late MusicManager musics = MusicManager();
  bool isDarkMode = false;

  factory Profile() {
    return _instance;
  }
  Future<void> fetch() async {
    _box = await Hive.openBox("profile");
    folders = _box.get("folders", defaultValue: []);
    isDarkMode = _box.get("isDarkMode", defaultValue: false);
    for (var path in folders) {}
    notifyListeners();
  }

  // fetchAllMedia() {
  //   for (var path in folders) {
  //     fetchMediaByFolder(path, notify: false);
  //   }
  //   notifyListeners();
  // }

  // fetchMediaByFolder(String folder, {notify = true}) {
  //   var dir = Directory(folder);
  //   List content = dir.listSync(recursive: true);
  //   for (var file in content) {
  //     if (file is File) {
  //       musics.addMusic(file.path.split('/').last, file.path);
  //     }
  //   }
  //   if (notify) {
  //     notifyListeners();
  //   }
  // }

  addMediaFolder(String folder) {
    folders.add(folder);
    _box.put("folders", folders);
    // MusicManager().fetch(folder);
  }

  removeMediaFolderByIndex(int index) {
    folders.remove(folders.elementAt(index));
    _box.put("folders", folders);
    // notifyListeners();
  }

  removeMediaFolder(String path) {
    // folders.remove(folders.elementAt(index));
    folders.remove(path);
    _box.put("folders", folders);
    // notifyListeners();
  }

  changeDarkMode() {
    isDarkMode = !isDarkMode;
    _box.put("isDarkMode", isDarkMode);
    notifyListeners();
  }

  Profile._internal() {
    fetch();
  }
  @override
  Future<void> dispose() async {
    super.dispose();
    await _box.close();
  }
}
