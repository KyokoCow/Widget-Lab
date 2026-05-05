import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/data/color_palettes.dart';

/// =========================
/// 共通インターフェース
/// =========================

typedef PreviewBuilder<T> = Widget Function(
    T config,
    ValueChanged<T> onChange,
    );

typedef SettingsBuilder<T> = Widget Function(
    ValueChanged<T> onChange,
    T config,
    AppColorPalette palette,
    );

typedef CodeBuilder<T> = String Function(T config);

/// =========================
/// Sample（ジェネリック化）
/// =========================

class Sample<T> {
  final String id;
  final String title;

  final PreviewBuilder<T> previewBuilder;
  final SettingsBuilder<T> settingsBuilder; // ←ここ修正
  final CodeBuilder<T> codeBuilder;

  const Sample({
    required this.id,
    required this.title,
    required this.previewBuilder,
    required this.settingsBuilder,
    required this.codeBuilder,
  });
}