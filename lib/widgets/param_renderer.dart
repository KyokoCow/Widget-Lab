import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/widgets/param_builder.dart';

import '../models/widget_touchparam.dart';


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
    final builder = ParamBuilder(
      values: values,
      onChanged: onChanged,
    );

    return ListView(
      children: touchParams.map(builder.build).toList(),
    );
  }
}