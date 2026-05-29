import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/config/app_settings.dart';
import 'package:flutter_ui_catalog/config/color_palettes.dart';
import 'package:flutter_ui_catalog/fonts/font_manager.dart';
import 'package:flutter_ui_catalog/models/parameter_schema.dart';
import 'package:flutter_ui_catalog/widgets/color_picker.dart';
import 'package:flutter_ui_catalog/widgets/font_picker.dart';
import 'package:flutter_ui_catalog/widgets/font_repository.dart';
import '../models/sample.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Sample> samples = [
  Sample(
    id: "text",
    title: "Text",
    parameters: const[],

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
    parameters: const[],

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
    parameters: const[

      SliderParameter(
        key: "width",
        label: "Width",
        defaultValue: 120,
        min: 50,
        max: 300,
        divisions: 250,
      ),

      SliderParameter(
        key: "height",
        label: "Height",
        defaultValue: 120,
        min: 50,
        max: 300,
        divisions: 250,
      ),

      SliderParameter(
        key: "padding",
        label: "Padding",
        defaultValue: 8,
        min: 0,
        max: 50,
      ),

      SliderParameter(
        key: "radius",
        label: "Border Radius",
        defaultValue: 0,
        min: 0,
        max: 50,
      ),

      ColorParameter(
        key: "color",
        label: "Color",
        defaultValue: Colors.blue,
      ),

      EnumParameter(
        key: "alignment",
        label: "Alignment",
        defaultValue: "center",

        values: [
          "center",
          "topLeft",
          "bottomRight",
        ],
      ),
    ],

    previewBuilder: (
        config,
        onChange,
        ) {
      Alignment alignment;

      switch (
      config["alignment"]
      ) {
        case "topLeft":
          alignment =
              Alignment.topLeft;
          break;

        case "bottomRight":
          alignment =
              Alignment.bottomRight;
          break;

        default:
          alignment =
              Alignment.center;
      }

      return Container(
        color: Colors.grey.shade300,

        child: Center(
          child: Container(
            width:
            (config["width"] ?? 120)
                .toDouble(),

            height:
            (config["height"] ?? 120)
                .toDouble(),

            padding: EdgeInsets.all(
              (config["padding"] ?? 8)
                  .toDouble(),
            ),

            alignment: alignment,

            decoration: BoxDecoration(
              color:
              config["color"] ??
                  Colors.blue,

              borderRadius:
              BorderRadius.circular(
                (
                    config["radius"] ??
                        0
                )
                    .toDouble(),
              ),

              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),

            child: const Text(
              "Child",
              style: TextStyle(
                color: Colors.white,
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ),
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
    parameters: const[],

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
    parameters: const[],

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
    parameters: const[],

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
    parameters: const[],

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
    parameters: const[],

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
    parameters: const[],

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