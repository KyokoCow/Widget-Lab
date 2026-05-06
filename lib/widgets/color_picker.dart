import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/config/app_settings.dart';
import 'package:flutter_ui_catalog/config/color_palettes.dart';

class ColorPicker extends StatelessWidget {
  final Color? selected;
  final ValueChanged<Color> onSelect;

  const ColorPicker({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppSettings.palette,
      builder: (_, paletteName, __) {
        final colors = AppPalettes.all[paletteName]!;

        return GridView.count(
          crossAxisCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          // ★ 少し詰めると見た目が締まる
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,

          children: colors.map((c) {
            final isSelected = c == selected;

            return GestureDetector(
              onTap: () => onSelect(c),

              // ★ 中央寄せ（これ重要）
              child: Center(
                child: Container(
                  // ★ 円サイズを小さく
                  width: 36,
                  height: 36,

                  decoration: BoxDecoration(
                    color: c,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(
                      color: Colors.purpleAccent, // ←ここを変更
                      width: 4,
                    )
                        : null,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}