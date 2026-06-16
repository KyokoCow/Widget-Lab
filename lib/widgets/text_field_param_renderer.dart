import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/widgets/param_builder.dart';

import '../models/widget_touchparam.dart';
import '../touch/touch_category.dart';
import '../utils/touch_list_category_label.dart';

class TextFieldParamRenderer extends StatelessWidget {
  final List<TouchParam> params;
  final Map<String, dynamic> values;
  final void Function(String, dynamic) onChanged;


  const TextFieldParamRenderer({
    super.key,
    required this.params,
    required this.values,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final builder = ParamBuilder(
      values: values,
      onChanged: onChanged,
    );

    final grouped = groupParamsByListCategory(params);

    return ListView(
      children: grouped.entries.map((entry) {
        return Card(
          color: _categoryColor(entry.key),
          child: ExpansionTile(
            title: Row(
              children: [
                Text(labelForTouchListCategory(entry.key)),
                const SizedBox(width: 8),
                Text('(${entry.value.length})'),
              ],
            ),
            children: entry.value.map(builder.build).toList(),
          ),
        );
      }).toList(),
    );
  }
}

Map<TouchListCategory, List<TouchParam>> groupParamsByListCategory(
    List<TouchParam> params,
    ) {
  final map = <TouchListCategory, List<TouchParam>>{};

  for (final p in params) {
    final key = p.listCategory;
    if (key == null) continue;

    map.putIfAbsent(key, () => []);
    map[key]!.add(p);
  }

  return map;
}

Color _categoryColor(TouchListCategory category) {
  switch (category) {
    case TouchListCategory.field:
      return Colors.blue.shade50;

    case TouchListCategory.placeholderLabel:
      return Colors.green.shade50;

    case TouchListCategory.inputRule:
      return Colors.red.shade50;

    case TouchListCategory.keyboard:
      return Colors.orange.shade50;

    case TouchListCategory.text:
      return Colors.purple.shade50;

    case TouchListCategory.cursor:
      return Colors.teal.shade50;

    case TouchListCategory.icon:
      return Colors.amber.shade50;
  }
}
