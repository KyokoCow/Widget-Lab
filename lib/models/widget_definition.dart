import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/models/widget_param.dart';
import 'package:flutter_ui_catalog/models/widget_touchparam.dart';

import '../ui/widget_ui.dart';


class WidgetDefinition {
  final String id;
  final String title;
  final String category;
  final String description;

  final List<WidgetParam> params;
  final List<TouchParam> touchParams;

  /// UIルール（唯一のUI定義）
  final WidgetUi ui;

  final Widget Function(Map<String, dynamic> values)? previewBuilder;
  final Widget Function()? miniPreviewBuilder;

  final String Function(Map<String, dynamic>)? codeBuilder;

  const WidgetDefinition({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.params,
    required this.ui,
    this.previewBuilder,
    this.miniPreviewBuilder,
    this.codeBuilder,
    this.touchParams = const [],
  });
}