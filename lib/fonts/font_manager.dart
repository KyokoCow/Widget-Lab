class FontManager {
  static List<String> availableFonts = [
    "Roboto",
    "Inter",
    "Open Sans",
    "Lato",
    "Montserrat",
    "Poppins",
    "Noto Sans JP",
  ];

  static Set<String> enabledFonts = {
    "Roboto",
    "Inter",
    "Noto Sans JP",
  };

  static bool isEnabled(String font) {
    return enabledFonts.contains(font);
  }

  static void toggleFont(String font, bool enabled) {
    if (enabled) {
      enabledFonts.add(font);
    } else {
      enabledFonts.remove(font);
    }
  }

  static void addFont(String font) {
    if (!availableFonts.contains(font)) {
      availableFonts.add(font);
      enabledFonts.add(font);
    }
  }

  static void removeFont(String font) {
    availableFonts.remove(font);
    enabledFonts.remove(font);
  }
}