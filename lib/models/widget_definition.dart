import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/models/widget_param.dart';
import 'package:flutter_ui_catalog/models/widget_touchparam.dart';



class WidgetDefinition {
  final String id;
  final String title;
  final String category;
  final String description;

  final List<WidgetParam> params;
  final List<TouchParam> touchParams;


  final Widget Function(Map<String, dynamic> values)? previewBuilder;
  final Widget Function()? miniPreviewBuilder;

  final String Function(Map<String, dynamic>)? codeBuilder;

  const WidgetDefinition({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.params,
    this.previewBuilder,
    this.miniPreviewBuilder,
    this.codeBuilder,
    this.touchParams = const [],
  });
}