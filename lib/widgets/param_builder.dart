import 'package:flutter/material.dart';

import '../constants/ui_spacing.dart';
import '../models/widget_touchparam.dart';
import '../touch/touch_category.dart';
import '../ui/touch_ui_type.dart';
import '../utils/safe_value.dart';

class ParamBuilder {
  final Map<String, dynamic> values;
  final void Function(String key, dynamic value) onChanged;

  ParamBuilder({
    required this.values,
    required this.onChanged,
  });

  Widget build(TouchParam param) {
    switch (param.uiType) {
      case TouchUiType.slider:
        return _buildSlider(param, SliderMode.integer);

      case TouchUiType.sliderDouble:
        return _buildSlider(param, SliderMode.doubleValue);

      case TouchUiType.discreteSlider:
        return _buildSlider(param, SliderMode.discrete);

      case TouchUiType.segmented:
        return _buildSelection(param, SelectionMode.segmented);

      case TouchUiType.choiceChip:
        return _buildSelection(param, SelectionMode.chip);

      case TouchUiType.radio:
        return _buildSelection(param, SelectionMode.radio);

      case TouchUiType.enumDropdown:
        return _buildSelection(param, SelectionMode.dropdown);

      case TouchUiType.tripleDropdown:
        return _buildTripleDropdown(param);

      case TouchUiType.checkbox:
        return _buildCheckbox(param);

      case TouchUiType.text:
        return _buildTextField(param);

      case TouchUiType.colorPicker:
        return _buildColorPicker(param);

      case TouchUiType.iconPicker:
        return _buildIconPicker(param);
    }
  }

  Widget buildParamLabel(TouchParam param, String text) {
    return Row(
      children: [
        if (param.category == TouchCategory.preview)
          const Icon(Icons.visibility, size: 16, color: Colors.blue),
        if (param.category == TouchCategory.config)
          const Icon(Icons.settings, size: 16, color: Colors.orange),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSlider(
      TouchParam param,
      SliderMode mode,
      ) {
    final value =
    ((values[param.key] ?? param.initialValue ?? 0) as num)
        .toDouble();

    final isEnabled = param.enabled?.call(values) ?? true;

    final min =
    (param.minProvider?.call(values) ?? param.min ?? 0)
        .toDouble();

    final max =
    (param.maxProvider?.call(values) ?? param.max ?? 100)
        .toDouble();

    final safeValue = value.clamp(min, max);

    int? divisions;

    if (mode == SliderMode.discrete) {
      final range = max - min;

      if (range <= 0) {
        divisions = null;
      } else if (range <= 10) {
        divisions = range.toInt();
      } else {
        divisions = (range / 10).round();
      }
    }

    String labelText;
    dynamic onChangedValue;

    switch (mode) {
      case SliderMode.integer:
        labelText =
        '${param.label ?? param.key}: ${value.toInt()}';
        onChangedValue = (double v) => v.round();
        break;

      case SliderMode.doubleValue:
        labelText =
        '${param.label ?? param.key}: ${value.toStringAsFixed(2)}';
        onChangedValue = (double v) => v;
        break;

      case SliderMode.discrete:
        labelText =
        '${param.label ?? param.key}: ${value.toInt()}';
        onChangedValue = (double v) => v.round();
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UiSpacing.page,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildParamLabel(param, labelText),
          Slider(
            min: min,
            max: max,
            divisions: divisions,
            value: safeValue,
            onChanged: isEnabled
                ? (v) => onChanged(
              param.key,
              onChangedValue(v),
            )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildSelection(
      TouchParam param,
      SelectionMode mode,
      ) {
    final items =
        param.itemsProvider?.call(values) ??
            param.items ??
            [];

    final value =
        values[param.key] ??
            param.initialValue ??
            (items.isNotEmpty ? items.first : '');

    final isEnabled = param.enabled?.call(values) ?? true;

    Widget content;

    switch (mode) {
      case SelectionMode.segmented:
        content = Center(
          child: SegmentedButton<String>(
            segments: [
              for (final item in items)
                ButtonSegment(
                  value: item,
                  label: Text(item),
                ),
            ],
            selected: {value.toString()},
            onSelectionChanged: isEnabled
                ? (selection) =>
                onChanged(param.key, selection.first)
                : null,
          ),
        );
        break;

      case SelectionMode.chip:
        content = Wrap(
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
        );
        break;

      case SelectionMode.radio:
        content = Column(
          children: [
            for (final item in items)
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
        );
        break;

      case SelectionMode.dropdown:
        content = DropdownButtonFormField<String>(
          value: value,
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
        );
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UiSpacing.page,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildParamLabel(
            param,
            param.label ?? param.key,
          ),
          const SizedBox(height: UiSpacing.item),
          content,
        ],
      ),
    );
  }

  Widget _buildCheckbox(TouchParam param) {
    final value =
        values[param.key] ?? param.initialValue ?? false;

    final safeValue = value is bool ? value : false;
    final isEnabled = param.enabled?.call(values) ?? true;

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
  }

  Widget _buildTripleDropdown(TouchParam param) {
    final items = param.intItems ?? [];
    final isEnabled = param.enabled?.call(values) ?? true;

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
      if (index >= value.length) return items.first;

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
                (e) => DropdownMenuItem(
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
  }

  Widget _buildTextField(TouchParam param) {
    final value =
    (values[param.key] ?? param.initialValue ?? '').toString();

    final isEnabled = param.enabled?.call(values) ?? true;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UiSpacing.page,
      ),
      child: Column(
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
              onChanged(
                param.key,
                text.isEmpty ? null : text,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildColorPicker(TouchParam param) {
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
            horizontal: UiSpacing.page,
            vertical: UiSpacing.item,
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
  }

  Widget _buildIconPicker(TouchParam param) {
    final value =
        values[param.key] ??
            param.initialValue ??
            (param.items?.isNotEmpty == true
                ? param.items!.first
                : 'none');

    final items = param.items ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: UiSpacing.page),
          child: buildParamLabel(
            param,
            param.label ?? param.key,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final item in items)
              ChoiceChip(
                label: Icon(
                  iconMap[item] ?? Icons.not_interested,
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
  }

}

enum SliderMode {
  integer,
  doubleValue,
  discrete,
}

enum SelectionMode {
  segmented,
  chip,
  radio,
  dropdown,
}

// ============================
// Icon Mapping (static data)
// ============================

const Map<String, IconData> iconMap = {
  'search': Icons.search,
  'home': Icons.home,
  'person': Icons.person,
  'favorite': Icons.favorite,
  'email': Icons.email,
  'phone': Icons.phone,
  'settings': Icons.settings,
  'menu': Icons.menu,
  'clear': Icons.clear,
};