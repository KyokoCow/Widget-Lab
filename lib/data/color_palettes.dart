import 'package:flutter/material.dart';

class AppColorPalette {
  final String name;
  final List<Color> colors;

  const AppColorPalette({
    required this.name,
    required this.colors,
  });
}

final palettes = [
  AppColorPalette(
    name: "Default",
    colors: [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.amber,
      Colors.pink,
      Colors.indigo,
      Colors.brown,
    ],
  ),

  AppColorPalette(
    name: "Soft",
    colors: [
      Color(0xFFB39DDB),
      Color(0xFF80CBC4),
      Color(0xFFFFCC80),
      Color(0xFFFFAB91),
      Color(0xFFA5D6A7),
      Color(0xFF90CAF9),
      Color(0xFFF48FB1),
      Color(0xFFE6EE9C),
      Color(0xFFCE93D8),
      Color(0xFFFFF59D),
    ],
  ),
];