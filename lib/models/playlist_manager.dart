import 'package:media_player/models/playlist.dart';

class PlaylistManager {
  static final PlaylistManager _instance = PlaylistManager._internal();
  List<Playlist> playlists = [];
  factory PlaylistManager() {
    return _instance;
  }
  PlaylistManager._internal() {
    playlists = [];
  }

  findByName(String name) {
    return playlists.where((element) => element.name == name);
  }

  getPlaylistByIndex(int index) {
    playlists.elementAt(index).playlist;
  }
}
