import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/widgets/font_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_catalog/fonts/font_manager.dart';

class FontPicker extends StatelessWidget {
  final String? selected;
  final ValueChanged<String> onSelect;

  const FontPicker({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final fonts = FontManager.enabledFonts;

    final current =
    fonts.contains(selected)
        ? selected!
        : fonts.first;

    return DropdownButton<String>(
      isExpanded: true,
      value: current,

      items: fonts.map((font) {
        return DropdownMenuItem(
          value: font,

          child: Text(
            "$font  AaBbCcあいうえお",

            style: GoogleFonts.getFont(
              FontRepository.resolve(font),
            ).copyWith(
              fontSize: 16,
            ),

            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),

      selectedItemBuilder: (context) {
        return fonts.map((font) {
          return Text(
            "$font  AaBbCcあいうえお",

            style: GoogleFonts.getFont(
              FontRepository.resolve(font),
            ).copyWith(
              fontSize: 16,
            ),

            overflow: TextOverflow.ellipsis,
          );
        }).toList();
      },

      onChanged: (font) {
        if (font != null) {
          onSelect(font);
        }
      },
    );
  }
}