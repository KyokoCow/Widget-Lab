import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/config/app_settings.dart';
import 'package:flutter_ui_catalog/config/color_palettes.dart';
import 'package:flutter_ui_catalog/fonts/font_manager.dart';
import 'package:flutter_ui_catalog/widgets/color_picker.dart';
import 'package:flutter_ui_catalog/widgets/font_repository.dart';
import '../models/sample.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Sample> samples = [
  Sample(
    id: "text",
    title: "Text",

    previewBuilder: (config, onChange) => Center(
      child: Text(
        config["text"] ?? "Hello",
        style: GoogleFonts.getFont(
          FontRepository.resolve(config["fontFamily"]),
        ).copyWith(
          fontSize: (config["size"] ?? 20).toDouble(),
          color: config["color"] ?? Colors.black,
        ),
      ),
    ),

    settingsBuilder: (onChange, config) {
      final fonts = FontRepository.enabledFonts();

      debugPrint("🔵 settingsBuilder config = $config");
      debugPrint("🔵 config fontFamily = ${config["fontFamily"]}");
      debugPrint("🟡 Dropdown fonts = $fonts");

      final current = fonts.contains(config["fontFamily"])
          ? config["fontFamily"]
          : FontRepository.defaultFont;

      return LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              12,
              12,
              12,
              MediaQuery.of(context).viewInsets.bottom + 24, // キーボード対応
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ■ テキスト入力
                  const Text("Text"),

                  TextFormField(
                    initialValue: config["text"] ?? "Hello",
                    onChanged: (v) => onChange({
                      ...config,
                      "text": v,
                    }),
                  ),

                  const SizedBox(height: 12),

                  // ■ フォント選択
                  const Text("Font"),

                  DropdownButton<String>(
                    isExpanded: true,
                    key: ValueKey(config["fontFamily"]),
                    value: current,
                    items: fonts.map((font) {
                      return DropdownMenuItem(
                        value: font,
                        child: Text(font),
                      );
                    }).toList(),
                    onChanged: (font) {
                      if (font == null) return;

                      onChange({
                        ...config,
                        "fontFamily": font,
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // ■ カラー
                  const Text("Color"),

                  ColorPicker(
                    selected: config["color"],
                    onSelect: (c) => onChange({
                      ...config,
                      "color": c,
                    }),
                  ),

                  const SizedBox(height: 24), // 下余白
                ],
              ),
            ),
          );
        },
      );
    },

    codeBuilder: (config) {
      final text = config["text"] ?? "Hello";
      final font = config["fontFamily"] ?? "Roboto";
      final size = config["size"] ?? 20;
      final color = config["color"] ?? Colors.black;

      String colorToCode(Color c) =>
          "Color(0x${c.value.toRadixString(16)})";

      return '''
Text(
  "$text",
  style: GoogleFonts.getFont("$font").copyWith(
    fontSize: $size,
    color: ${colorToCode(color)},
  ),
)
''';
    },
  ),


  Sample(
    id: "icon_button",
    title: "IconButton",

    previewBuilder: (config, onChange) => Center(
      child: IconButton(
        icon: Icon(config["icon"] ?? Icons.favorite),
        color: config["color"] ?? Colors.red,
        iconSize: (config["size"] ?? 40).toDouble(),
        onPressed: () {
          // IconButton自体は状態変化がないので空でOK
        },
      ),
    ),

    settingsBuilder: (onChange, config) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ■ アイコン選択
            DropdownButton<IconData>(
              isExpanded: true, // ←これも地味に重要（横はみ出し防止）
              value: config["icon"] ?? Icons.favorite,
              items: const [
                DropdownMenuItem(
                  value: Icons.favorite,
                  child: Text("favorite"),
                ),
                DropdownMenuItem(
                  value: Icons.star,
                  child: Text("star"),
                ),
                DropdownMenuItem(
                  value: Icons.home,
                  child: Text("home"),
                ),
              ],
              onChanged: (v) {
                if (v != null) {
                  onChange({...config, "icon": v});
                }
              },
            ),

            const SizedBox(height: 12),

            // ■ サイズ
            const Text("Size"),
            Slider(
              min: 20,
              max: 80,
              divisions: 60,
              value: (config["size"] ?? 40).toDouble(),
              label: "${config["size"] ?? 40}",
              onChanged: (v) {
                onChange({...config, "size": v.round()});
              },
            ),

            const SizedBox(height: 16),

            // ■ カラー
            const Text("Color"),
            ColorPicker(
              selected: config["color"],
              onSelect: (c) => onChange({
                ...config,
                "color": c,
              }),
            ),

            const SizedBox(height: 24), // ← 下余白（ナビバー対策）
          ],
        ),
      );
    },

    codeBuilder: (config) {
      final icon = config["icon"] ?? Icons.favorite;
      final size = config["size"] ?? 40;
      final color = config["color"] ?? Colors.red;

      String colorToCode(Color c) =>
          "Color(0x${c.value.toRadixString(16)})";

      String iconToCode(IconData icon) {
        if (icon == Icons.star) return "Icons.star";
        if (icon == Icons.home) return "Icons.home";
        return "Icons.favorite";
      }

      return '''
IconButton(
  icon: Icon(${iconToCode(icon)}),
  color: ${colorToCode(color)},
  iconSize: $size,
  onPressed: () {},
)
''';
    },
  ),
  Sample(
    id: "container",
    title: "Container",

    previewBuilder: (config, onChange) => Center(
      child: Container(
        width: (config["width"] ?? 100).toDouble(),
        height: (config["height"] ?? 100).toDouble(),
        color: config["color"] ?? Colors.blue,
      ),
    ),

    settingsBuilder: (onChange, config) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Width"),
            Slider(
              min: 50,
              max: 300,
              divisions: 250,
              value: (config["width"] ?? 100).toDouble(),
              label: "${config["width"] ?? 100}",
              onChanged: (v) =>
                  onChange({...config, "width": v.round()}),
            ),

            const SizedBox(height: 12),

            const Text("Height"),
            Slider(
              min: 50,
              max: 300,
              divisions: 250,
              value: (config["height"] ?? 100).toDouble(),
              label: "${config["height"] ?? 100}",
              onChanged: (v) =>
                  onChange({...config, "height": v.round()}),
            ),

            const SizedBox(height: 16),

            const Text("Color"),
            ColorPicker(
              selected: config["color"],
              onSelect: (c) => onChange({
                ...config,
                "color": c,
              }),
            ),

            const SizedBox(height: 24), // ← ナビバー対策
          ],
        ),
      );
    },

    codeBuilder: (config) {
      final w = config["width"] ?? 100;
      final h = config["height"] ?? 100;
      final color = config["color"] ?? Colors.blue;

      String colorToCode(Color c) =>
          "Color(0x${c.value.toRadixString(16)})";

      return '''
Container(
  width: $w,
  height: $h,
  color: ${colorToCode(color)},
)
''';
    },
  ),

  Sample(
    id: "slider",
    title: "Slider",

    previewBuilder: (config, onChange) => Center(
      child: Slider(
        value: (config["value"] ?? 0.5).toDouble(),
        onChanged: (v) => onChange({
          ...config,
          "value": v,
        }),
        activeColor: config["color"] ?? Colors.blue,
      ),
    ),

    settingsBuilder: (onChange, config) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          // ★ Slider本体は削除（previewに統一）

          const Text("Value"),
          Text(
            ((config["value"] ?? 0.5).toDouble()).toStringAsFixed(2),
          ),

          const SizedBox(height: 16),

          const Text("Active Color"),
          ColorPicker(
            selected: config["color"],
            onSelect: (c) => onChange({
              ...config,
              "color": c,
            }),
          ),
        ],
      );
    },

    codeBuilder: (config) {
      final value = config["value"] ?? 0.5;
      final color = config["color"] ?? Colors.blue;

      String colorToCode(Color c) =>
          "Color(0x${c.value.toRadixString(16)})";

      return '''
Slider(
  value: $value,
  onChanged: (_) {},
  activeColor: ${colorToCode(color)},
)
''';
    },
  ),

  Sample(
    id: "switch",
    title: "Switch",

    previewBuilder: (config, onChange) => Center(
      child: Switch(
        value: config["value"] ?? true,
        onChanged: (v) {
          onChange({...config, "value": v});
        },
        activeColor: config["activeColor"] ?? Colors.blue,
        activeTrackColor:
        config["activeTrackColor"] ?? Colors.blue.withOpacity(0.5),
        inactiveThumbColor:
        config["inactiveThumbColor"] ?? Colors.grey,
        inactiveTrackColor:
        config["inactiveTrackColor"] ?? Colors.grey.shade400,
      ),
    ),

    settingsBuilder: (onChange, config) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ★ ON/OFF削除（プレビューで操作）

            const Text("Active Thumb"),
            ColorPicker(
              selected: config["activeColor"],
              onSelect: (c) => onChange({
                ...config,
                "activeColor": c,
              }),
            ),

            const SizedBox(height: 12),

            const Text("Active Track"),
            ColorPicker(
              selected: config["activeTrackColor"],
              onSelect: (c) => onChange({
                ...config,
                "activeTrackColor": c,
              }),
            ),

            const SizedBox(height: 12),

            const Text("Inactive Thumb"),
            ColorPicker(
              selected: config["inactiveThumbColor"],
              onSelect: (c) => onChange({
                ...config,
                "inactiveThumbColor": c,
              }),
            ),

            const SizedBox(height: 12),

            const Text("Inactive Track"),
            ColorPicker(
              selected: config["inactiveTrackColor"],
              onSelect: (c) => onChange({
                ...config,
                "inactiveTrackColor": c,
              }),
            ),
          ],
        ),
      );
    },

    codeBuilder: (config) {
      final value = config["value"] ?? true;
      final active = config["activeColor"] ?? Colors.blue;
      final activeTrack =
          config["activeTrackColor"] ?? Colors.blue.withOpacity(0.5);
      final inactive = config["inactiveThumbColor"] ?? Colors.grey;
      final inactiveTrack =
          config["inactiveTrackColor"] ?? Colors.grey.shade400;

      String colorToCode(Color c) =>
          "Color(0x${c.value.toRadixString(16)})";

      return '''
Switch(
  value: $value,
  onChanged: (v) {},
  activeColor: ${colorToCode(active)},
  activeTrackColor: ${colorToCode(activeTrack)},
  inactiveThumbColor: ${colorToCode(inactive)},
  inactiveTrackColor: ${colorToCode(inactiveTrack)},
)
''';
    },
  ),
  Sample(
    id: "checkbox",
    title: "Checkbox",

    previewBuilder: (config, onChange) {
      final value = config["value"] ?? true;

      return Center(
        child: GestureDetector(
          onTap: () {
            onChange({
              ...config,
              "value": !value,
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: value,
                onChanged: (v) {
                  onChange({
                    ...config,
                    "value": v,
                  });
                },
                activeColor: config["activeColor"] ?? Colors.blue,
                checkColor: config["checkColor"] ?? Colors.white,
              ),
              const Text("Check me"),
            ],
          ),
        ),
      );
    },

    settingsBuilder: (onChange, config) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Active Color"),
            ColorPicker(
              selected: config["activeColor"],
              onSelect: (c) => onChange({
                ...config,
                "activeColor": c,
              }),
            ),

            const SizedBox(height: 12),

            const Text("Check Color"),
            ColorPicker(
              selected: config["checkColor"],
              onSelect: (c) => onChange({
                ...config,
                "checkColor": c,
              }),
            ),
          ],
        ),
      );
    },

    codeBuilder: (config) {
      final value = config["value"] ?? true;
      final active = config["activeColor"] ?? Colors.blue;
      final check = config["checkColor"] ?? Colors.white;

      String colorToCode(Color c) =>
          "Color(0x${c.value.toRadixString(16)})";

      return '''
Checkbox(
  value: $value,
  onChanged: (_) {},
  activeColor: ${colorToCode(active)},
  checkColor: ${colorToCode(check)},
)
''';
    },
  ),
  Sample(
    id: "card",
    title: "Card",

    previewBuilder: (config, onChange) => Center(
      child: Card(
        color: config["color"] ?? Colors.white,
        elevation: (config["elevation"] ?? 4).toDouble(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            (config["radius"] ?? 12).toDouble(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            config["text"] ?? "Card",
            style: TextStyle(
              color: config["textColor"] ?? Colors.black,
            ),
          ),
        ),
      ),
    ),

    settingsBuilder: (onChange, config) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ■ Text（主操作）
            const Text("Text"),

            TextFormField(
              initialValue: config["text"] ?? "Card",
              decoration: const InputDecoration(labelText: "Card Text"),
              onChanged: (v) => onChange({
                ...config,
                "text": v,
              }),
            ),

            const SizedBox(height: 16),

            // ■ Elevation
            const Text("Elevation"),
            Slider(
              min: 0,
              max: 20,
              divisions: 20,
              value: (config["elevation"] ?? 4).toDouble(),
              label: "${config["elevation"] ?? 4}",
              onChanged: (v) =>
                  onChange({...config, "elevation": v.round()}),
            ),

            const SizedBox(height: 12),

            // ■ Radius
            const Text("Border Radius"),
            Slider(
              min: 0,
              max: 40,
              divisions: 40,
              value: (config["radius"] ?? 12).toDouble(),
              label: "${config["radius"] ?? 12}",
              onChanged: (v) =>
                  onChange({...config, "radius": v.round()}),
            ),

            const SizedBox(height: 16),

            // ■ Colors（ここが主戦場）
            const Text("Card Color"),
            ColorPicker(
              selected: config["color"],
              onSelect: (c) => onChange({
                ...config,
                "color": c,
              }),
            ),

            const SizedBox(height: 12),

            const Text("Text Color"),
            ColorPicker(
              selected: config["textColor"],
              onSelect: (c) => onChange({
                ...config,
                "textColor": c,
              }),
            ),
          ],
        ),
      );
    },

    codeBuilder: (config) {
      final text = config["text"] ?? "Card";
      final color = config["color"] ?? Colors.white;
      final textColor = config["textColor"] ?? Colors.black;
      final elevation = config["elevation"] ?? 4;
      final radius = config["radius"] ?? 12;

      String colorToCode(Color c) =>
          "Color(0x${c.value.toRadixString(16)})";

      return '''
Card(
  color: ${colorToCode(color)},
  elevation: $elevation,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular($radius),
  ),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text(
      "$text",
      style: TextStyle(
        color: ${colorToCode(textColor)},
      ),
    ),
  ),
)
''';
    },
  ),
  Sample(
    id: "textfield",
    title: "TextField",

    previewBuilder: (config, onChange) => Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          decoration: InputDecoration(
            hintText: config["hint"] ?? "Enter text",
            labelText: config["label"] ?? "Label",

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                (config["radius"] ?? 8).toDouble(),
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                (config["radius"] ?? 8).toDouble(),
              ),
              borderSide: BorderSide(
                color: config["focusColor"] ?? Colors.blue,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    ),

    settingsBuilder: (onChange, config) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ■ hint
            const Text("Hint"),

            TextFormField(
              initialValue: config["hint"] ?? "",
              onChanged: (v) => onChange({
                ...config,
                "hint": v,
              }),
            ),

            const SizedBox(height: 12),

            /// ■ label
            const Text("Label"),

            TextFormField(
              initialValue: config["label"] ?? "",
              onChanged: (v) => onChange({
                ...config,
                "label": v,
              }),
            ),

            const SizedBox(height: 12),

            // ■ radius
            const Text("Border Radius"),
            Slider(
              min: 0,
              max: 30,
              divisions: 30,
              value: (config["radius"] ?? 8).toDouble(),
              label: "${config["radius"] ?? 8}",
              onChanged: (v) =>
                  onChange({...config, "radius": v.round()}),
            ),

            const SizedBox(height: 16),

            // ■ focus color
            const Text("Focus Color"),
            ColorPicker(
              selected: config["color"],
              onSelect: (c) => onChange({
                ...config,
                "color": c,
              }),
            ),
          ],
        ),
      );
    },

    codeBuilder: (config) {
      final hint = config["hint"] ?? "Enter text";
      final label = config["label"] ?? "Label";
      final radius = config["radius"] ?? 8;
      final focus = config["focusColor"] ?? Colors.blue;

      String colorToCode(Color c) =>
          "Color(0x${c.value.toRadixString(16)})";

      return '''
TextField(
  decoration: InputDecoration(
    hintText: "$hint",
    labelText: "$label",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular($radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular($radius),
      borderSide: BorderSide(
        color: ${colorToCode(focus)},
        width: 2,
      ),
    ),
  ),
)
''';
    },
  ),

  Sample(
    id: "button",
    title: "Button",

    previewBuilder: (config, onChange) {
      final text = config["text"] ?? "Button";
      final type = config["type"] ?? "elevated";
      final color = config["color"] ?? Colors.blue;

      switch (type) {
        case "text":
          return TextButton(
            onPressed: () {},
            child: Text(text),
          );

        case "outlined":
          return OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: color),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  (config["radius"] ?? 8).toDouble(),
                ),
              ),
            ),
            child: Text(text),
          );

        default:
          return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              elevation: (config["elevation"] ?? 2).toDouble(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  (config["radius"] ?? 8).toDouble(),
                ),
              ),
            ),
            child: Text(text),
          );
      }
    },
    settingsBuilder: (onChange, config) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ■ type（主軸）
            DropdownButton<String>(
              value: config["type"] ?? "elevated",
              items: const [
                DropdownMenuItem(value: "elevated", child: Text("Elevated")),
                DropdownMenuItem(value: "text", child: Text("Text")),
                DropdownMenuItem(value: "outlined", child: Text("Outlined")),
              ],
              onChanged: (v) {
                if (v != null) {
                  onChange({...config, "type": v});
                }
              },
            ),

            const SizedBox(height: 12),

            // ■ text
            TextFormField(
              initialValue: config["text"] ?? "Button",
              decoration: const InputDecoration(labelText: "Text"),
              onChanged: (v) => onChange({
                ...config,
                "text": v,
              }),
            ),

            const SizedBox(height: 16),

            // ■ color
            const Text("Color"),
            ColorPicker(
              selected: config["color"],
              onSelect: (c) => onChange({
                ...config,
                "color": c,
              }),
            ),

            const SizedBox(height: 16),

            // ■ elevation（elevatedのみ意味あり）
            const Text("Elevation"),
            Slider(
              min: 0,
              max: 30,
              divisions: 30,
              value: (config["elevation"] ?? 2).toDouble(),
              label: "${config["elevation"] ?? 2}",
              onChanged: (v) =>
                  onChange({...config, "elevation": v.round()}),
            ),

            const SizedBox(height: 12),

            // ■ radius（共通）
            const Text("Border Radius"),
            Slider(
              min: 0,
              max: 30,
              divisions: 30,
              value: (config["radius"] ?? 8).toDouble(),
              label: "${config["radius"] ?? 8}",
              onChanged: (v) =>
                  onChange({...config, "radius": v.round()}),
            ),
            const SizedBox(height: 24), // ← ナビバー対策
          ],
        ),
      );
    },

    codeBuilder: (config) {
      final text = config["text"] ?? "Button";
      final type = config["type"] ?? "elevated";
      final color = config["color"] ?? Colors.blue;
      final elevation = config["elevation"] ?? 2;
      final radius = config["radius"] ?? 8;

      String colorToCode(Color c) =>
          "Color(0x${c.value.toRadixString(16)})";

      switch (type) {
        case "text":
          return '''
TextButton(
  onPressed: () {},
  child: Text("$text"),
)
''';

        case "outlined":
          return '''
OutlinedButton(
  onPressed: () {},
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: ${colorToCode(color)}),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular($radius),
    ),
  ),
  child: Text("$text"),
)
''';

        default:
          return '''
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: ${colorToCode(color)},
    elevation: $elevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular($radius),
    ),
  ),
  child: Text("$text"),
)
''';
      }
    },
  ),
];