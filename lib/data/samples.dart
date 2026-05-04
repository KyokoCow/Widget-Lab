import 'package:flutter/material.dart';
import '../models/sample.dart';

final List<Sample> samples = [
  Sample(
    id: "text",
    title: "Text",
    code: 'Text("Hello Flutter")',
    builder: () => const Center(child: Text("Hello Flutter")),
  ),

  Sample(
    id: "container",
    title: "Container",
    code: '''
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
)
''',
    builder: () => Center(
      child: Container(width: 100, height: 100, color: Colors.blue),
    ),
  ),

  Sample(
    id: "row",
    title: "Row",
    code: '''
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [Icon(Icons.star), Icon(Icons.star)],
)
''',
    builder: () => const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.star), Icon(Icons.star)],
    ),
  ),
];