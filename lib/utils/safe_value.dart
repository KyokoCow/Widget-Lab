import 'package:flutter/material.dart';

Color safeColor(
    dynamic value, {
      Color fallback = Colors.white,
    }) {
  if (value is Color) {
    return value;
  }
  if (value is num) {
    return Color(value.toInt());
  }
  return fallback;
}

double safeDouble(
    dynamic value, {
      double fallback = 0.0,
    }) {
  if (value is num) {
    return value.toDouble();
  }
  return fallback;
}

int safeInt(
    dynamic value, {
      int fallback = 0,
    }) {
  if (value is num) {
    return value.toInt();
  }
  return fallback;
}

bool safeBool(
    dynamic value, {
      bool fallback = false,
    }) {
  if (value is bool) {
    return value;
  }
  return fallback;
}

String safeString(
    dynamic value, {
      String fallback = '',
    }) {
  if (value is String) {
    return value;
  }
  return fallback;
}

String? safeText(
    dynamic value, {
      String? fallback,
    }) {
  if (value is String) {
    final text = value.trim();
    if (text.isNotEmpty) {
      return text;
    }
  }
  return fallback;
}
