import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Profile extends ChangeNotifier {
  static final Profile _instance = Profile._internal();
  var _box;

  Set<String> folders = {};
  List<String> music = [];
  bool isDarkMode = false;

  factory Profile() {
    return _instance;
  }
  Future<void> fetch() async {
    _box = await Hive.openBox("profile");
    folders = _box.get("folders", defaultValue: []);
    isDarkMode = _box.get("isDarkMode", defaultValue: false);
    // TODO:Configurar pastas defaults
    if (folders.isEmpty) {
      // folders.add("")
    }
  }

  fetchAllMedia() {
    for (var path in folders) {
      fetchMediaByFolder(path, notify: false);
    }
    notifyListeners();
  }

  fetchMediaByFolder(String folder, {notify = true}) {
    var dir = Directory(folder);
    List content = dir.listSync(recursive: true);
    for (var file in content) {
      if (file is File) {
        music.add(file.path);
      }
    }
    if (notify) {
      notifyListeners();
    }
  }

  addMediaFolder(String folder) {
    folders.add(folder);
    _box.put("folders", folders);
    fetchMediaByFolder(folder);
  }

  removeMediaFolder(int index) {
    folders.remove(folders.elementAt(index));
    _box.put("folders", folders);
    notifyListeners();
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
