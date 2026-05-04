import 'package:flutter/material.dart';

class Sample {
  final String id;
  final String title;
  final String code;
  final Widget Function() builder;

  const Sample({
    required this.id,
    required this.title,
    required this.code,
    required this.builder,
  });
}