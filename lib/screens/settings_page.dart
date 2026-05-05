import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/fonts/font_manager.dart';
import 'package:flutter_ui_catalog/screens/font_settings_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabledCount = FontManager.enabledFonts.length;
    final totalCount = FontManager.availableFonts.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [

          // =========================
          // 背景色設定（仮）
          // =========================
          const ListTile(
            title: Text("Background Color"),
            subtitle: Text("Not implemented yet"),
            leading: Icon(Icons.format_color_fill),
          ),

          const Divider(),

          // =========================
          // カラーパレット設定（仮）
          // =========================
          const ListTile(
            title: Text("Color Palette"),
            subtitle: Text("Not implemented yet"),
            leading: Icon(Icons.palette),
          ),

          const Divider(),

          // =========================
          // フォント設定
          // =========================
          ListTile(
            title: const Text("Fonts"),
            subtitle: Text(
              "Enabled: $enabledCount / $totalCount",
            ),
            leading: const Icon(Icons.font_download),
            trailing: const Icon(Icons.chevron_right),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FontSettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}