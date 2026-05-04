import 'package:flutter/material.dart';

class Sample {
  final String id;
  final String title;
  final String code;

  final Widget Function(Map<String, dynamic> config) previewBuilder;

  final Widget Function(
      ValueChanged<Map<String, dynamic>> onChange,
      Map<String, dynamic> config,
      ) settingsBuilder;

  final String Function(Map<String, dynamic> config) codeBuilder;

  const Sample({
    required this.id,
    required this.title,
    required this.code,
    required this.previewBuilder,
    required this.settingsBuilder,
    required this.codeBuilder,
  });
}