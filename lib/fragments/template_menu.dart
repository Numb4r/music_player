import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TemplateMenu extends StatelessWidget {
  TemplateMenu({super.key, required this.body, this.appBar});
  Widget body;
  var appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: const Text("Music Player"),
          ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text("Music Player")),
            ListTile(
              title: Text("Configuracoes"),
            ),
            ListTile(
              title: Text("Car Mode"),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
