import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

final textFieldDefinition = WidgetDefinition(
  id: 'textField',
  title: 'TextField',
  category: 'Input',
  parentId: 'StatefulWidget',
  description: 'ユーザーがテキストを入力できるWidget',

  params: [],

  touchParams: [
    TouchParam(
      key: 'text',
      uiType: TouchUiType.text,
      label: 'Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'hintText',
      uiType: TouchUiType.text,
      label: 'Hint Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'width',
      uiType: TouchUiType.slider,
      label: 'Width',
      initialValue: 240.0,
      min: 100,
      max: 400,
    ),

    TouchParam(
      key: 'enabled',
      uiType: TouchUiType.checkbox,
      label: 'Enabled',
      initialValue: true,
    ),

    TouchParam(
      key: 'readOnly',
      uiType: TouchUiType.checkbox,
      label: 'Read Only',
      initialValue: false,
    ),
  ],

  previewBuilder: (values) {
    final width =
    (values['width'] ?? 240.0).toDouble();

    final text =
        values['text'] ?? '';

    final hintText =
        values['hintText'] ?? '';

    final enabled =
        values['enabled'] ?? true;

    final readOnly =
        values['readOnly'] ?? false;

    return SizedBox(
      width: width,
      child: TextField(
        controller: TextEditingController(
          text: text,
        ),
        decoration: InputDecoration(
          hintText: hintText,
        ),
        enabled: enabled,
        readOnly: readOnly,
      ),
    );
  },

  miniPreviewBuilder: () {
    return const SizedBox(
      width: 120,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'TextField',
        ),
      ),
    );
  },

  codeBuilder: (values) {
    final hintText =
        values['hintText'] ?? '';

    final enabled =
        values['enabled'] ?? true;

    final readOnly =
        values['readOnly'] ?? false;

    return '''
TextField(
  decoration: InputDecoration(
    hintText: '$hintText',
  ),
  enabled: $enabled,
  readOnly: $readOnly,
)
''';
  },
);