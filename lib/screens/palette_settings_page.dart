import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/config/color_palettes.dart';
import 'package:flutter_ui_catalog/config/app_settings.dart';

class PaletteSettingsPage extends StatefulWidget {
  const PaletteSettingsPage({super.key});

  @override
  State<PaletteSettingsPage> createState() => _PaletteSettingsPageState();
}

class _PaletteSettingsPageState extends State<PaletteSettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Palette"),
      ),
      body: ListView(
        children: AppPalettes.all.entries.map((entry) {
          final name = entry.key;
          final colors = entry.value;

          final isSelected = name == AppSettings.palette.value;

          return ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: colors.take(5).map((c) {
                return Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(right: 2),
                  decoration: BoxDecoration(
                    color: c,
                    shape: BoxShape.circle,
                  ),
                );
              }).toList(),
            ),

            title: Text(name),

            trailing: isSelected
                ? const Icon(Icons.check, color: Colors.blue)
                : null,

            onTap: () {
              AppSettings.palette.value = name;
              Navigator.pop(context); // 即戻るのがUX良い
            },
          );
        }).toList(),
      ),
    );
  }
}