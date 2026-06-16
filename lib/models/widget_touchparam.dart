import '../touch/touch_category.dart';
import '../ui/touch_ui_type.dart';

typedef TouchEnabled =
bool Function(Map<String, dynamic> values);

typedef TouchNumProvider =
num Function(Map<String, dynamic> values);

class TouchParam {
  final String key;
  final TouchUiType uiType;
  final TouchCategory? category;

  final String? label;
  final num? min;
  final num? max;
  final dynamic initialValue;

  final List<String>? items;
  final List<int>? intItems;
  final TouchEnabled? enabled;
  final TouchNumProvider? minProvider;
  final TouchNumProvider? maxProvider;

  final List<String> Function(
      Map<String, dynamic> values,
      )? itemsProvider;

  const TouchParam({
    required this.key,
    required this.uiType,

    this.category,

    this.label,
    this.min,
    this.max,
    this.initialValue,
    this.items,
    this.intItems,
    this.enabled,
    this.minProvider,
    this.maxProvider,
    this.itemsProvider,
  });
}