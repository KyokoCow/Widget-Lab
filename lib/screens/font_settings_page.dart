import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/fonts/font_manager.dart';
import 'package:flutter_ui_catalog/fonts/google_font_catalog.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        title: const Text("Fonts"),
      ),

      // =========================
      // FAB：フォント追加
      // =========================
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _showAddFontDialog,
      ),

      body: ListView.separated(
        itemCount: fonts.length,

        separatorBuilder: (_, __) => const Divider(
          height: 1,
        ),

        itemBuilder: (context, index) {
          final font = fonts[index];
          final name = font.name;
          final enabled = FontManager.isEnabled(name);

          final hasFont =
          GoogleFonts.asMap().containsKey(name);

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),

            // =========================
            // フォント名プレビュー
            // =========================
            title: Text(
              "$name   AaBbCc あいうえお",

              style: hasFont
                  ? GoogleFonts.getFont(name).copyWith(
                fontSize: 16,
              )
                  : const TextStyle(
                fontSize: 16,
              ),

              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),

            // =========================
            // カテゴリ
            // =========================
            subtitle: Text(
              font.category.toUpperCase(),
            ),

            // =========================
            // ON/OFF
            // =========================
            leading: Checkbox(
              value: enabled,
              onChanged: (v) {
                setState(() {
                  FontManager.toggleFont(
                    name,
                    v ?? false,
                  );
                });
              },
            ),

            // =========================
            // 削除
            // =========================
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
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                final font =
                _controller.text.trim();

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