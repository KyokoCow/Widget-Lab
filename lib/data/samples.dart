import 'package:flutter/material.dart';
import '../models/sample.dart';

final List<Sample> samples = [
  Sample(
    id: "container",
    title: "Container",
    code: "Container(...)",

    previewBuilder: (config) {
      return Container(
        width: config["size"] ?? 100,
        height: config["size"] ?? 100,
        color: config["color"] ?? Colors.blue,
      );
    },

    settingsBuilder: (onChange, config) {
      final size = config["size"] ?? 100;
      final color = config["color"] ?? Colors.blue;

      return Column(
        children: [
          Slider(
            value: size.toDouble(),
            min: 50,
            max: 300,
            onChanged: (v) {
              onChange({
                ...config,
                "size": v,
                "color": color,
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              onChange({
                ...config,
                "size": size,
                "color": Colors.red,
              });
            },
            child: const Text("赤に変更"),
          ),
        ],
      );
    },

    codeBuilder: (config) {
      final size = config["size"] ?? 100;
      final color = config["color"] ?? "blue";

      return '''
Container(
  width: $size,
  height: $size,
  color: $color,
)
''';
    },
  )
];