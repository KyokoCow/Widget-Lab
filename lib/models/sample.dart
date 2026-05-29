import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/config/color_palettes.dart';
import 'package:flutter_ui_catalog/models/parameter_schema.dart';

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
    );

typedef CodeBuilder<T> = String Function(T config);

/// =========================
/// Sample（ジェネリック化）
/// =========================

class Sample<T> {
  final String id;
  final String title;

  final PreviewBuilder<T>
  previewBuilder;

  final CodeBuilder<T>
  codeBuilder;

  final List<ParameterSchema>
  parameters;

  const Sample({
    required this.id,
    required this.title,
    required this.previewBuilder,
    required this.codeBuilder,

    this.parameters = const [],
  });
}
