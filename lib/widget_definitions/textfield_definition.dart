import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../ui/touch_ui_type.dart';
import '../ui/ui_constraints.dart';
import '../ui/ui_rules.dart';
import '../ui/widget_ui.dart';

final textFieldDefinition = WidgetDefinition(
  id: 'textfield',
  title: 'TextField',
  category: 'Input',
  description: 'ユーザーから文字入力を受け取る',

  previewBuilder: (values) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter text',
      ),
    ),
  ),

  miniPreviewBuilder: () => const Icon(Icons.text_fields),

  ui: WidgetUi(
    rules: UiRules(
      overrides: {
        'text': TouchUiType.text,
      },
    ),
    constraints: const UiConstraints(
      sliders: {},
      enums: {},
    ),
  ),

  params: [
    WidgetParam(
      name: 'text',
      type: 'String',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      defaultValue: '',
      description: '入力テキスト',
      sdkDescription: 'TextField controller value',
    ),

    WidgetParam(
      name: 'obscureText',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      defaultValue: false,
      description: 'パスワード表示にするか',
      sdkDescription: 'Obscures text for passwords',
    ),
  ],
);