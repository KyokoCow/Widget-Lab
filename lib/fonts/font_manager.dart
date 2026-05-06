import 'package:flutter/foundation.dart';

class FontManager {
  static final ValueNotifier<int> notifier = ValueNotifier(0);

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

  static void toggleFont(String font, bool enabled) {
    if (enabled) {
      enabledFonts.add(font);
    } else {
      enabledFonts.remove(font);
    }

    debugPrint("🔥 FontManager.enabledFonts = $enabledFonts");
    _notify();
  }

  static void addFont(String font) {
    availableFonts.add(font);
    enabledFonts.add(font);
    _notify();
  }

  static void removeFont(String font) {
    availableFonts.remove(font);
    enabledFonts.remove(font);
    _notify();
  }

  static void _notify() {
    notifier.value++;
  }
  static bool isEnabled(String font) {
    return enabledFonts.contains(font);
  }
}