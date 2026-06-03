import 'package:flutter/material.dart';

import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

class ParamRenderer extends StatelessWidget {
  final List<TouchParam> touchParams;
  final Map<String, dynamic> values;
  final void Function(String key, dynamic value) onChanged;

  const ParamRenderer({
    super.key,
    required this.touchParams,
    required this.values,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: touchParams.map(_buildParam).toList(),
    );
  }

  Widget _buildParam(TouchParam param) {
    switch (param.uiType) {
    // ----------------------------
    // Slider
    // ----------------------------
      case TouchUiType.slider:
        final value =
        ((values[param.key] ?? param.initialValue ?? 0) as num)
            .toDouble();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${param.key}: ${value.toInt()}'),
            Slider(
              min: (param.min ?? 0).toDouble(),
              max: (param.max ?? 100).toDouble(),
              value: value,
              onChanged: (v) => onChanged(param.key, v),
            ),
          ],
        );

    // ----------------------------
    // Checkbox
    // ----------------------------
      case TouchUiType.checkbox:
        final value =
            values[param.key] ??
                param.initialValue ??
                false;

        final safeValue = value is bool ? value : false;

        return CheckboxListTile(
          value: safeValue,
          onChanged: (v) => onChanged(param.key, v ?? false),
          title: Text(param.key),
        );

    // ----------------------------
    // Enum dropdown
    // ----------------------------
      case TouchUiType.enumDropdown:
        final items = param.items ?? [];

        if (items.isEmpty) {
          return Text('Missing enum items: ${param.key}');
        }

        final value = values[param.key];

        final safeValue =
        (value is String && items.contains(value))
            ? value
            : items.first;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              param.label ?? param.key,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),

            DropdownButtonFormField<String>(
              value: safeValue,
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
                  .toList(),
              onChanged: (v) {
                if (v == null) return;
                onChanged(param.key, v);
              },
            ),
          ],
        );

    // ----------------------------
    // Text
    // ----------------------------
      case TouchUiType.text:
        return ListTile(
          title: Text('${param.key} (Text)'),
        );

    // ----------------------------
    // Color
    // ----------------------------
      case TouchUiType.color:
        return ListTile(
          title: Text('${param.key} (Color)'),
        );

    // ----------------------------
    // EdgeInsets
    // ----------------------------
      case TouchUiType.edgeInsets:
        return ListTile(
          title: Text('${param.key} (EdgeInsets)'),
        );
    }
  }
}