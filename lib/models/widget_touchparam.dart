import '../ui/touch_ui_type.dart';

class TouchParam {
  final String key;
  final TouchUiType uiType;
  final String? label;
  final num? min;
  final num? max;
  final dynamic initialValue;

  final List<String>? items; // ← 追加

  const TouchParam({
    required this.key,
    required this.uiType,
    this.label,
    this.min,
    this.max,
    this.initialValue,
    this.items,
  });
}