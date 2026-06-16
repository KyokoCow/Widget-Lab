import 'package:flutter/material.dart';

import '../models/widget_touchparam.dart';
import '../touch/touch_category.dart';
import '../ui/touch_ui_type.dart';
import '../utils/safe_value.dart';

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
        final isEnabled =
            param.enabled?.call(values) ?? true;
        final min =
        (param.minProvider?.call(values) ?? param.min ?? 0)
            .toDouble();

        final max =
        (param.maxProvider?.call(values) ?? param.max ?? 100)
            .toDouble();
        final safeValue = value.clamp(min, max);

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
              value: safeValue,
              onChanged: isEnabled
                  ? (v) => onChanged(param.key, v.round())
                  : null,
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
        final isEnabled =
            param.enabled?.call(values) ?? true;
        final min =
        (param.minProvider?.call(values) ?? param.min ?? 0)
            .toDouble();

        final max =
        (param.maxProvider?.call(values) ?? param.max ?? 100)
            .toDouble();

        final safeValue = value.clamp(min, max);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildParamLabel(
              param,
              '${param.label ?? param.key}: ${value.toStringAsFixed(2)}',
            ),
            Slider(
              min: min,
              max: max,
              value: safeValue,
              onChanged: isEnabled
                  ? (v) => onChanged(param.key, v)
                  : null,
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

        final isEnabled =
            param.enabled?.call(values) ?? true;

        final min =
        (param.minProvider?.call(values) ?? param.min ?? 0)
            .toDouble();

        final max =
        (param.maxProvider?.call(values) ?? param.max ?? 100)
            .toDouble();

        final safeValue = value.clamp(min, max);

        final range = max - min;

        final int? divisions;

        if (range <= 0) {
          divisions = null;
        } else if (range <= 10) {
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
              value: safeValue,
              label: safeValue.toInt().toString(),
              onChanged: isEnabled
                  ? (v) => onChanged(param.key, v.round())
                  : null,
            ),
          ],
        );

// ----------------------------
// Segmented Button
// ----------------------------
      case TouchUiType.segmented:
        final items =
            param.itemsProvider?.call(values) ??
                param.items ??
                [];

        final value =
            values[param.key] ??
                param.initialValue ??
                (items.isNotEmpty ? items.first : '');
        final isEnabled =
            param.enabled?.call(values) ?? true;

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
                  for (final item in items)
                    ButtonSegment<String>(
                      value: item,
                      label: Text(item),
                    ),
                ],
                selected: {value.toString()},
                onSelectionChanged: isEnabled
                    ? (selection) {
                  onChanged(param.key, selection.first);
                }
                    : null,
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
        final items =
            param.itemsProvider?.call(values) ??
                param.items ??
                [];
        final isEnabled =
            param.enabled?.call(values) ?? true;

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
                for (final item in items)
                  ChoiceChip(
                    label: Text(item),
                    selected: value == item,
                    onSelected: isEnabled
                        ? (_) => onChanged(param.key, item)
                        : null,
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
        final isEnabled =
            param.enabled?.call(values) ?? true;

        return CheckboxListTile(
          value: safeValue,
          onChanged: isEnabled
              ? (v) => onChanged(param.key, v)
              : null,
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
        final isEnabled =
            param.enabled?.call(values) ?? true;

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
                      onChanged: isEnabled
                          ? (v) => onChanged(param.key, v)
                          : null,
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
        final items =
            param.itemsProvider?.call(values) ??
                param.items ??
                [];
        final isEnabled =
            param.enabled?.call(values) ?? true;

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
              onChanged: isEnabled
                  ? (v) {
                if (v == null) return;
                onChanged(param.key, v);
              }
                  : null,
            ),
          ],
        );

    // ----------------------------
// Triple Dropdown
// ----------------------------
      case TouchUiType.tripleDropdown:
        final items = param.intItems ?? [];
        final isEnabled =
            param.enabled?.call(values) ?? true;

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
              onChanged: isEnabled
                  ? (v) {
                if (v == null) return;

                final newValue = List<int>.from(value);

                while (newValue.length < 3) {
                  newValue.add(items.first);
                }

                newValue[index] = v;

                onChanged(param.key, newValue);
              }
                  : null,
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
        final isEnabled =
            param.enabled?.call(values) ?? true;

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
              enabled: isEnabled,
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
        final color = safeColor(
          values[param.key] ?? param.initialValue,
        );

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
                children: colors.map((item) {
                  final selected = color.value == item.value;

                  return GestureDetector(
                    onTap: () => onChanged(
                      param.key,
                      item.value,
                    ),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: item,
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
                        color: item.computeLuminance() > 0.5
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
// Icon Picker
// ----------------------------
      case TouchUiType.iconPicker:
        final value =
            values[param.key] ??
                param.initialValue ??
                (param.items?.isNotEmpty == true
                    ? param.items!.first
                    : 'none');

        IconData getIcon(String name) {
          switch (name) {
            case 'search':
              return Icons.search;
            case 'home':
              return Icons.home;
            case 'person':
              return Icons.person;
            case 'favorite':
              return Icons.favorite;
            case 'email':
              return Icons.email;
            case 'phone':
              return Icons.phone;
            case 'settings':
              return Icons.settings;
            case 'menu':
              return Icons.menu;
            case 'clear':
              return Icons.clear;
            default:
              return Icons.not_interested;
          }
        }

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
                    label: Icon(
                      getIcon(item),
                      size: 20,
                    ),
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
    // EdgeInsets
    // ----------------------------
      case TouchUiType.edgeInsets:
        return ListTile(
          title: Text('${param.key} (EdgeInsets)'),
        );
    }
  }
}