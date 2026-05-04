import 'package:flutter/material.dart';
import '../models/sample.dart';

final List<Sample> samples = [
  Sample(
    id: "text",
    title: "Text",

    previewBuilder: (config) => Center(
      child: Text(
        config["text"] ?? "Hello",
        style: TextStyle(fontSize: config["size"] ?? 20),
      ),
    ),

    settingsBuilder: (onChange, config) {
      return Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Text"),
            onChanged: (v) => onChange({...config, "text": v}),
          ),
          Slider(
            min: 10,
            max: 50,
            value: (config["size"] ?? 20).toDouble(),
            onChanged: (v) => onChange({...config, "size": v}),
          ),
        ],
      );
    },

    codeBuilder: (config) => '''
Text("${config["text"] ?? "Hello"}")
''',
  ),

  Sample(
    id: "icon",
    title: "Icon",

    previewBuilder: (config) => Center(
      child: Icon(
        config["icon"] ?? Icons.star,
        size: config["size"] ?? 40,
        color: config["color"] ?? Colors.blue,
      ),
    ),

    settingsBuilder: (onChange, config) {
      return Column(
        children: [
          Slider(
            min: 20,
            max: 100,
            value: (config["size"] ?? 40).toDouble(),
            onChanged: (v) => onChange({...config, "size": v}),
          ),
        ],
      );
    },

    codeBuilder: (config) => '''
Icon(Icons.star)
''',
  ),
  Sample(
    id: "icon_button",
    title: "IconButton",

    previewBuilder: (config) => Center(
      child: IconButton(
        icon: Icon(config["icon"] ?? Icons.favorite),
        color: config["color"] ?? Colors.red,
        iconSize: config["size"] ?? 40,
        onPressed: () {},
      ),
    ),

    settingsBuilder: (onChange, config) {
      return Column(
        children: [
          DropdownButton<IconData>(
            value: config["icon"] ?? Icons.favorite,
            items: const [
              DropdownMenuItem(value: Icons.favorite, child: Text("favorite")),
              DropdownMenuItem(value: Icons.star, child: Text("star")),
              DropdownMenuItem(value: Icons.home, child: Text("home")),
            ],
            onChanged: (v) => onChange({...config, "icon": v}),
          ),
          Slider(
            min: 20,
            max: 80,
            value: (config["size"] ?? 40).toDouble(),
            onChanged: (v) => onChange({...config, "size": v}),
          ),
        ],
      );
    },

    codeBuilder: (config) => '''
IconButton(
  icon: Icon(Icons.favorite),
)
''',
  ),
  Sample(
    id: "container",
    title: "Container",

    previewBuilder: (config) => Center(
      child: Container(
        width: config["size"] ?? 100,
        height: config["size"] ?? 100,
        color: config["color"] ?? Colors.blue,
      ),
    ),

    settingsBuilder: (onChange, config) {
      return Column(
        children: [
          Slider(
            min: 50,
            max: 200,
            value: (config["size"] ?? 100).toDouble(),
            onChanged: (v) => onChange({...config, "size": v}),
          ),
        ],
      );
    },

    codeBuilder: (config) => '''
Container(
  width: ${config["size"] ?? 100},
  height: ${config["size"] ?? 100},
)
''',
  ),
  Sample(
    id: "slider",
    title: "Slider",

    previewBuilder: (config) => Center(
      child: Slider(
        value: config["value"] ?? 0.5,
        onChanged: (_) {},
      ),
    ),

    settingsBuilder: (onChange, config) {
      return Column(
        children: [
          Slider(
            value: config["value"] ?? 0.5,
            onChanged: (v) => onChange({...config, "value": v}),
          ),
        ],
      );
    },

    codeBuilder: (config) => '''
Slider(value: ${config["value"] ?? 0.5})
''',
  ),
  Sample(
    id: "switch",
    title: "Switch",

    previewBuilder: (config) => Center(
      child: Switch(
        value: config["value"] ?? true,
        onChanged: (_) {},
      ),
    ),

    settingsBuilder: (onChange, config) {
      return Switch(
        value: config["value"] ?? true,
        onChanged: (v) => onChange({...config, "value": v}),
      );
    },

    codeBuilder: (config) => '''
Switch(value: true)
''',
  ),
  Sample(
    id: "checkbox",
    title: "Checkbox",

    previewBuilder: (config) => Center(
      child: Checkbox(
        value: config["value"] ?? true,
        onChanged: (_) {},
      ),
    ),

    settingsBuilder: (onChange, config) {
      return Checkbox(
        value: config["value"] ?? true,
        onChanged: (v) => onChange({...config, "value": v}),
      );
    },

    codeBuilder: (config) => '''
Checkbox(value: true)
''',
  ),
  Sample(
    id: "card",
    title: "Card",

    previewBuilder: (config) => Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(config["text"] ?? "Card"),
        ),
      ),
    ),

    settingsBuilder: (onChange, config) {
      return TextField(
        onChanged: (v) => onChange({...config, "text": v}),
      );
    },

    codeBuilder: (config) => '''
Card(child: Text("Card"))
''',
  ),
  Sample(
    id: "textfield",
    title: "TextField",

    previewBuilder: (config) => Center(
      child: TextField(
        decoration: InputDecoration(
          hintText: config["hint"] ?? "Enter text",
        ),
      ),
    ),

    settingsBuilder: (onChange, config) {
      return TextField(
        onChanged: (v) => onChange({...config, "hint": v}),
      );
    },

    codeBuilder: (config) => '''
TextField()
''',
  ),
  Sample(
    id: "button",
    title: "Button",

    previewBuilder: (config) => Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(config["text"] ?? "Button"),
      ),
    ),

    settingsBuilder: (onChange, config) {
      return TextField(
        onChanged: (v) => onChange({...config, "text": v}),
      );
    },

    codeBuilder: (config) => '''
ElevatedButton(
  child: Text("Button"),
)
''',
  )
];