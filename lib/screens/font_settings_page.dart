import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/fonts/font_manager.dart';
import 'package:flutter_ui_catalog/fonts/google_font_catalog.dart';

class FontSettingsPage extends StatefulWidget {
  const FontSettingsPage({super.key});

  @override
  State<FontSettingsPage> createState() => _FontSettingsPageState();
}

class _FontSettingsPageState extends State<FontSettingsPage> {
  late Set<String> tempEnabled;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    tempEnabled = Set.from(FontManager.enabledFonts);
  }

  @override
  Widget build(BuildContext context) {
    final fonts = googleFontCatalog;

    return Scaffold(
      appBar: AppBar(title: const Text("Fonts")),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _applyChanges,
        icon: const Icon(Icons.check),
        label: const Text("Apply"),
      ),

      body: ListView.builder(
        itemCount: fonts.length,
        itemBuilder: (context, index) {
          final font = fonts[index];
          final name = font.name;
          final enabled = tempEnabled.contains(name);

          return ListTile(
            title: Text(name),
            subtitle: Text(font.category),

            leading: Checkbox(
              value: enabled,
              onChanged: (v) {
                setState(() {
                  if (v == true) {
                    tempEnabled.add(name);
                  } else {
                    tempEnabled.remove(name);
                  }
                });
              },
            ),

            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  tempEnabled.remove(name);
                  FontManager.availableFonts.remove(name);
                });
              },
            ),
          );
        },
      ),
    );
  }

  // =========================
  // Apply（確実反映版）
  // =========================
  void _applyChanges() {
    setState(() {
      FontManager.enabledFonts = Set.from(tempEnabled);

      // availableFontsも同期（ズレ防止）
      FontManager.availableFonts = googleFontCatalog
          .map((f) => f.name)
          .where((name) =>
      FontManager.enabledFonts.contains(name) ||
          tempEnabled.contains(name))
          .toList();
    });

    Navigator.pop(context);
  }

  // =========================
  // フォント追加
  // =========================
  void _showAddFontDialog() {
    _controller.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Font"),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "e.g. Roboto",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final font = _controller.text.trim();

                if (font.isNotEmpty) {
                  setState(() {
                    FontManager.availableFonts.add(font);
                    tempEnabled.add(font);
                  });
                }

                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}