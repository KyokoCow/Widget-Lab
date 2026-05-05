import 'package:flutter_ui_catalog/fonts/font_manager.dart';
import 'package:flutter_ui_catalog/fonts/google_font_catalog.dart';

class FontRepository {
  /// デフォルトフォント（全Widget共通）
  static const String defaultFont = "Roboto";

  /// 全フォント一覧（マスタ）
  static List<String> allFonts() {
    return googleFontCatalog.map((f) => f.name).toList();
  }

  /// 有効フォント一覧（UI表示用）
  static List<String> enabledFonts() {
    return FontManager.availableFonts
        .where((f) => FontManager.isEnabled(f))
        .toList();
  }

  /// Widget用の安全なフォント解決
  static String resolve(String? fontFamily) {
    final enabled = enabledFonts();

    if (fontFamily == null) return defaultFont;
    if (enabled.contains(fontFamily)) return fontFamily;

    return defaultFont;
  }
}