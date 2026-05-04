import 'package:flutter/material.dart';

/// =========================
/// 共通インターフェース
/// =========================

typedef PreviewBuilder<T> = Widget Function(T config);

typedef SettingsBuilder<T> = Widget Function(
    ValueChanged<T> onChange,
    T config,
    );

typedef CodeBuilder<T> = String Function(T config);

/// =========================
/// Sample（ジェネリック化）
/// =========================

class Sample<T> {
  final String id;
  final String title;

  final PreviewBuilder<T> previewBuilder;
  final SettingsBuilder<T> settingsBuilder;
  final CodeBuilder<T> codeBuilder;

  const Sample({
    required this.id,
    required this.title,
    required this.previewBuilder,
    required this.settingsBuilder,
    required this.codeBuilder,
  });
}