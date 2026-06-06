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
    // discreteSlider
    // ----------------------------
      case TouchUiType.discreteSlider:
        final value =
        ((values[param.key] ?? param.initialValue ?? 0) as num)
            .toDouble();

        final min = (param.min ?? 0).toDouble();
        final max = (param.max ?? 100).toDouble();

        // 目盛り間隔を自動計算
        int divisions;
        final range = max - min;

        if (range <= 10) {
          divisions = range.toInt(); // 0～10 → 1刻み
        } else {
          divisions = (range / 10).round(); // 0～100 → 10刻み
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${param.key}: ${value.toInt()}'),
            Slider(
              min: min,
              max: max,
              divisions: divisions,
              value: value.clamp(min, max),
              label: value.toInt().toString(), // 吹き出し表示
              onChanged: (v) => onChanged(
                param.key,
                v.round(),
              ),
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
    // Triple Dropdown
    // ----------------------------
      case TouchUiType.tripleDropdown:
        final items = param.intItems ?? [];

        if (items.isEmpty) {
          return Text('Missing intItems: ${param.key}');
        }

        final rawInitial = param.initialValue;

        final value =
            (values[param.key] as List<int>?) ??
                (rawInitial is List ? rawInitial.map((e) => e as int).toList() : null) ??
                [items.first, items.first, items.first];

        int getValue(int index) {
          if (index >= value.length) {
            return items.first;
          }

          final v = value[index];
          return items.contains(v) ? v : items.first;
        }

        Widget buildDropdown(int index) {
          return Expanded(
            child: DropdownButtonFormField<int>(
              value: getValue(index),
              isExpanded: true,
              items: items
                  .map(
                    (e) => DropdownMenuItem<int>(
                  value: e,
                  child: Text('$e'),
                ),
              )
                  .toList(),
              onChanged: (v) {
                if (v == null) return;

                final newValue = List<int>.from(value);

                while (newValue.length < 3) {
                  newValue.add(items.first);
                }

                newValue[index] = v;

                onChanged(param.key, newValue);
              },
            ),
          );
        }

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

            Row(
              children: [
                buildDropdown(0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(':'),
                ),
                buildDropdown(1),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(':'),
                ),
                buildDropdown(2),
              ],
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