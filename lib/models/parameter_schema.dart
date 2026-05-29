import 'package:flutter/material.dart';

abstract class ParameterSchema {
  final String key;
  final String label;
  final dynamic defaultValue;

  const ParameterSchema({
    required this.key,
    required this.label,
    required this.defaultValue,
  });
}

class SliderParameter extends ParameterSchema {
  final double min;
  final double max;
  final int? divisions;

  const SliderParameter({
    required super.key,
    required super.label,
    required super.defaultValue,
    required this.min,
    required this.max,
    this.divisions,
  });
}

class ColorParameter extends ParameterSchema {
  const ColorParameter({
    required super.key,
    required super.label,
    required super.defaultValue,
  });
}

class EnumParameter extends ParameterSchema {
  final List<String> values;

  const EnumParameter({
    required super.key,
    required super.label,
    required super.defaultValue,
    required this.values,
  });
}