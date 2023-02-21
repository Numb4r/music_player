import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SizedBox(
        child: TextButton(
          onPressed: () async {
            String? selectedDirectory =
                await FilePicker.platform.getDirectoryPath();

            if (selectedDirectory != null) {
              print(selectedDirectory + " selected");
            } else {
              print("no selected directory");
            }
          },
          child: const Text("click me"),
        ),
      ),
    );
  }
}
