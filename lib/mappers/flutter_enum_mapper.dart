import 'package:flutter/material.dart';

class FlutterEnumMapper {
  static MainAxisSize mainAxisSize(String value) {
    switch (value) {
      case 'min':
        return MainAxisSize.min;
      case 'max':
      default:
        return MainAxisSize.max;
    }
  }

  static CrossAxisAlignment crossAxisAlignment(String value) {
    switch (value) {
      case 'start':
        return CrossAxisAlignment.start;
      case 'center':
        return CrossAxisAlignment.center;
      case 'end':
        return CrossAxisAlignment.end;
      case 'stretch':
        return CrossAxisAlignment.stretch;
      default:
        return CrossAxisAlignment.center;
    }
  }

  static Clip clipBehavior(String value) {
    switch (value) {
      case 'none':
        return Clip.none;
      case 'hardEdge':
        return Clip.hardEdge;
      case 'antiAlias':
        return Clip.antiAlias;
      case 'antiAliasWithSaveLayer':
        return Clip.antiAliasWithSaveLayer;
      default:
        return Clip.none;
    }
  }
}