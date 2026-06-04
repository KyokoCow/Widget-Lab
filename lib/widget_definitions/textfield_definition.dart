import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';


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