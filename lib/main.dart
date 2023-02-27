import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:media_player/controllers/music_manager.dart';
import 'package:media_player/controllers/player_controller.dart';
import 'package:media_player/controllers/route_manager.dart';
import 'package:media_player/models/profile.dart';
import 'package:media_player/screens/config_screen.dart';

import 'package:media_player/screens/folder_configuration_screen.dart';
import 'package:media_player/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  await Hive.initFlutter();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Profile()),
      ChangeNotifierProvider(create: (_) => PlayerController()),
      ChangeNotifierProvider(create: (_) => MusicManager()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
        //     .copyWith(secondary: Colors.amber),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
        //     .copyWith(secondary: Colors.amber),
      ),
      initial: context.read<Profile>().isDarkMode
          ? AdaptiveThemeMode.dark
          : AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: RouteManager.homePage,
        onGenerateRoute: RouteManager.generateRoute,
        // home: const HomeScreen(),
      ),
    );
  }
}
