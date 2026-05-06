import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/fonts/font_manager.dart';
import 'package:flutter_ui_catalog/fonts/google_font_catalog.dart';

class FontSettingsPage extends StatefulWidget {
  const FontSettingsPage({super.key});

  @override
  State<FontSettingsPage> createState() => _FontSettingsPageState();
}

class _FontSettingsPageState extends State<FontSettingsPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fonts = googleFontCatalog;

    return Scaffold(
      appBar: AppBar(title: const Text("Fonts")),

      // =========================
      // FAB：フォント追加
      // =========================
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _showAddFontDialog,
      ),

      body: ListView.builder(
        itemCount: fonts.length,
        itemBuilder: (context, index) {
          final font = fonts[index];
          final name = font.name;
          final enabled = FontManager.isEnabled(name);

          return ListTile(
            title: Text(name),
            subtitle: Text(font.category),

            leading: Checkbox(
              value: enabled,
              onChanged: (v) {
                setState(() {
                  FontManager.toggleFont(name, v ?? false);
                });
              },
            ),

            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  FontManager.removeFont(name);
                });
              },
            ),
          );
        },
      ),
    );
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
                    FontManager.addFont(font);
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