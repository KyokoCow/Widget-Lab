import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/fonts/font_manager.dart';
import 'package:flutter_ui_catalog/screens/font_settings_page.dart';
import 'package:flutter_ui_catalog/config/app_settings.dart';
import 'package:flutter_ui_catalog/screens/palette_settings_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [

          const ListTile(
            title: Text("Background Color"),
            subtitle: Text("Not implemented yet"),
            leading: Icon(Icons.format_color_fill),
          ),

          const Divider(),

          /// ■ カラーパレット選択（修正済み）
          ValueListenableBuilder<String>(
            valueListenable: AppSettings.palette,
            builder: (_, paletteName, __) {
              return ListTile(
                title: const Text("Color Palette"),
                subtitle: Text(paletteName),
                leading: const Icon(Icons.palette),
                trailing: const Icon(Icons.chevron_right),

                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PaletteSettingsPage(),
                    ),
                  );
                  // setState不要（自動更新される）
                },
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text("Fonts"),
            subtitle: Text(
              "Enabled: ${FontManager.enabledFonts.length}",
            ),
            leading: const Icon(Icons.font_download),
            trailing: const Icon(Icons.chevron_right),

            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FontSettingsPage(),
                ),
              );

              setState(() {}); // フォントはNotifier化してないので必要
            },
          ),
        ],
      ),
    );
  }
}