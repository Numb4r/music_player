import 'package:flutter/material.dart';

import 'package:media_player/fragments/template_menu.dart';
import 'package:media_player/models/profile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

class FolderConfigurationScreen extends StatelessWidget {
  const FolderConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listFolders = context.watch<Profile>().folders.toList();
    // List<String> listFolders = context.watch<Profile>().music;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pastas"),
        actions: [
          IconButton(
              onPressed: () async {
                String? selectedDirectory =
                    await FilePicker.platform.getDirectoryPath();

                if (selectedDirectory != null) {
                  context.read<Profile>().addMediaFolder(selectedDirectory);
                }
              },
              icon: const Icon(Icons.abc))
        ],
      ),
      body: listFolders.isEmpty
          ? const Center(
              child: Text("Nao existe pastas"),
            )
          : Center(
              child: ListView.builder(
                itemCount: listFolders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listFolders[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        context.read<Profile>().removeMediaFolder(index);
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
