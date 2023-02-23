import 'package:flutter/material.dart';
import 'package:media_player/screens/folder_configuration_screen.dart';
import 'package:media_player/screens/home_screen.dart';

class RouteManager {
  static const String homePage = "/";
  static const String folderManagerPage = "/folderManager";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case folderManagerPage:
        return MaterialPageRoute(
            builder: (context) => const FolderConfigurationScreen());

      default:
        throw "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    }
  }
}
