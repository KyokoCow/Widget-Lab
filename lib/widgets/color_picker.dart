import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final List<Color> colors;
  final Color? selected;
  final ValueChanged<Color> onSelect;

  const ColorPicker({
    super.key,
    required this.colors,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: colors.map((c) {
        final isSelected = c == selected;

        return GestureDetector(
          onTap: () => onSelect(c),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: c,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: Colors.black, width: 3)
                  : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}