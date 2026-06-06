import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';

final centerDefinition = WidgetDefinition(
  id: 'center',
  title: 'Center',
  category: 'Layout',
  parentId: 'Align',
  description: '子Widgetを利用可能な領域の中央に配置するWidget',
  miniPreviewBuilder: () => const Icon(Icons.center_focus_strong),

  params: [
    WidgetParam(
      name: 'child',
      type: 'Widget?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '中央に配置する子Widget',
    ),

    WidgetParam(
      name: 'widthFactor',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'Centerの幅を子Widgetの幅×倍率にする',
    ),

    WidgetParam(
      name: 'heightFactor',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'Centerの高さを子Widgetの高さ×倍率にする',
    ),


  ]

);