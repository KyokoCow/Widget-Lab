class FontSettings {
  final Set<String> enabledFonts;
  String currentFont;

  FontSettings({
    required this.enabledFonts,
    required this.currentFont,
  });

  factory FontSettings.initial() {
    return FontSettings(
      enabledFonts: {"Roboto", "Inter", "Noto Sans JP"},
      currentFont: "Roboto",
    );
  }

  bool isEnabled(String font) => enabledFonts.contains(font);

  void toggle(String font, bool enabled) {
    if (enabled) {
      enabledFonts.add(font);
    } else {
      enabledFonts.remove(font);
    }
  }
}