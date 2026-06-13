import 'package:flutter/material.dart';

import '../models/widget_touchparam.dart';
import '../touch/touch_category.dart';
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

  Widget buildParamLabel(
      TouchParam param,
      String text,
      ) {
    return Row(
      children: [
        if (param.category == TouchCategory.preview) ...[
          const Icon(
            Icons.visibility,
            size: 16,
            color: Colors.blue,
          ),
          const SizedBox(width: 4),
        ],
        if (param.category == TouchCategory.config) ...[
          const Icon(
            Icons.settings,
            size: 16,
            color: Colors.orange,
          ),
          const SizedBox(width: 4),
        ],
        Text(text),
      ],
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
            buildParamLabel(
              param,
              '${param.label ?? param.key}: ${value.toInt()}',
            ),
            Slider(
              min: (param.min ?? 0).toDouble(),
              max: (param.max ?? 100).toDouble(),
              value: value,
              onChanged: (v) => onChanged(param.key, v),
            ),
          ],
        );

// ----------------------------
// Slider(Double)
// ----------------------------
      case TouchUiType.sliderDouble:
        final value =
        ((values[param.key] ?? param.initialValue ?? 0) as num)
            .toDouble();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildParamLabel(
              param,
              '${param.label ?? param.key}: ${value.toStringAsFixed(2)}',
            ),
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

        int divisions;
        final range = max - min;

        if (range <= 10) {
          divisions = range.toInt();
        } else {
          divisions = (range / 10).round();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildParamLabel(
              param,
              '${param.label ?? param.key}: ${value.toInt()}',
            ),
            Slider(
              min: min,
              max: max,
              divisions: divisions,
              value: value.clamp(min, max),
              label: value.toInt().toString(),
              onChanged: (v) => onChanged(
                param.key,
                v.round(),
              ),
            ),
          ],
        );

// ----------------------------
// Segmented Button
// ----------------------------
      case TouchUiType.segmented:
        final value =
            values[param.key] ??
                param.initialValue ??
                (param.items?.isNotEmpty == true ? param.items!.first : '');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildParamLabel(
              param,
              param.label ?? param.key,
            ),
            const SizedBox(height: 8),
            Center(
              child: SegmentedButton<String>(
                segments: [
                  for (final item in param.items ?? [])
                    ButtonSegment<String>(
                      value: item,
                      label: Text(item),
                    ),
                ],
                selected: {value.toString()},
                onSelectionChanged: (selection) {
                  onChanged(param.key, selection.first);
                },
              ),
            ),
          ],
        );
// ----------------------------
// Choice Chip
// ----------------------------
      case TouchUiType.choiceChip:
        final value =
            values[param.key] ??
                param.initialValue ??
                (param.items?.isNotEmpty == true ? param.items!.first : '');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildParamLabel(
              param,
              param.label ?? param.key,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final item in param.items ?? [])
                  ChoiceChip(
                    label: Text(item),
                    selected: value == item,
                    onSelected: (_) {
                      onChanged(param.key, item);
                    },
                  ),
              ],
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
          title: buildParamLabel(
            param,
            param.label ?? param.key,
          ),
        );

// ----------------------------
// Radio Button
// ----------------------------
      case TouchUiType.radio:
        final value =
            values[param.key] ??
                param.initialValue ??
                (param.items?.isNotEmpty == true ? param.items!.first : '');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: buildParamLabel(
                param,
                param.label ?? param.key,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  for (final item in (param.items ?? []))
                    RadioListTile<String>(
                      value: item,
                      groupValue: value.toString(),
                      onChanged: (v) {
                        if (v != null) {
                          onChanged(param.key, v);
                        }
                      },
                      title: Text(item),
                      dense: true,
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
            ),
          ],
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
            buildParamLabel(
              param,
              param.label ?? param.key,
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
                (rawInitial is List
                    ? rawInitial.map((e) => e as int).toList()
                    : null) ??
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
            buildParamLabel(
              param,
              param.label ?? param.key,
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
        final value =
        (values[param.key] ?? param.initialValue ?? '').toString();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildParamLabel(
              param,
              param.label ?? param.key,
            ),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (text) {
                onChanged(param.key, text);
              },
            ),
          ],
        );

// ----------------------------
// Color Picker
// ----------------------------
      case TouchUiType.colorPicker:
        final value =
            values[param.key] ??
                param.initialValue ??
                Colors.white.value;

        final safeValue =
        value is int ? value : Colors.white.value;

        const colors = [
          Colors.white,
          Colors.black,
          Colors.red,
          Colors.pink,
          Colors.orange,
          Colors.yellow,
          Colors.green,
          Colors.teal,
          Colors.blue,
          Colors.indigo,
          Colors.purple,
          Colors.brown,
          Colors.grey,
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: buildParamLabel(
                param,
                param.label ?? param.key,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: colors.map((color) {
                  final selected = safeValue == color.value;

                  return GestureDetector(
                    onTap: () => onChanged(
                      param.key,
                      color.value,
                    ),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selected
                              ? Colors.blue
                              : Colors.grey,
                          width: selected ? 3 : 1,
                        ),
                      ),
                      child: selected
                          ? Icon(
                        Icons.check,
                        size: 18,
                        color:
                        color.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white,
                      )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
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