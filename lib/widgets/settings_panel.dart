import 'package:flutter/material.dart';

import '../models/parameter_schema.dart';
import 'color_picker.dart';

class SettingsPanel extends StatelessWidget {
  final List<ParameterSchema> parameters;

  final Map<String, dynamic> config;

  final void Function(Map<String, dynamic>)
  onChange;

  const SettingsPanel({
    super.key,
    required this.parameters,
    required this.config,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          for (final p in parameters)
            _buildParameter(p),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildParameter(
      ParameterSchema p,
      ) {
    if (p is SliderParameter) {
      final value =
      (config[p.key] ??
          p.defaultValue)
          .toDouble();

      return Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          Text(p.label),

          Slider(
            min: p.min,
            max: p.max,
            divisions: p.divisions,
            value: value,

            label:
            value
                .round()
                .toString(),

            onChanged:
                (v) => onChange({
              ...config,
              p.key: v,
            }),
          ),

          const SizedBox(height: 16),
        ],
      );
    }

    if (p is ColorParameter) {
      return Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          Text(p.label),

          ColorPicker(
            selected:
            config[p.key] ??
                p.defaultValue,

            onSelect:
                (c) => onChange({
              ...config,
              p.key: c,
            }),
          ),

          const SizedBox(height: 16),
        ],
      );
    }

    if (p is EnumParameter) {
      return Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          Text(p.label),

          DropdownButton<String>(
            value:
            config[p.key] ??
                p.defaultValue,

            isExpanded: true,

            items:
            p.values
                .map(
                  (v) =>
                  DropdownMenuItem(
                    value: v,
                    child: Text(v),
                  ),
            )
                .toList(),

            onChanged:
                (v) => onChange({
              ...config,
              p.key: v,
            }),
          ),

          const SizedBox(height: 16),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}