import 'package:flutter_ui_catalog/fonts/font_manager.dart';
import 'package:flutter_ui_catalog/fonts/google_font_catalog.dart';

class FontRepository {
  /// デフォルトフォント
  static const String defaultFont = "Roboto";

  /// 全フォント一覧（マスタ）
  static List<String> allFonts() {
    return googleFontCatalog.map((f) => f.name).toList();
  }

  /// 有効フォント一覧（唯一の参照元に統一）
  static List<String> enabledFonts() {
    return FontManager.enabledFonts.toList();
  }

  /// Widget用の安全なフォント解決
  static String resolve(String? fontFamily) {
    final enabled = enabledFonts();

    if (fontFamily == null) return defaultFont;
    if (enabled.contains(fontFamily)) return fontFamily;

    return defaultFont;
  }
}