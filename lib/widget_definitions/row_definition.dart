import 'package:flutter/material.dart';
import '../ui/touch_ui_type.dart';
import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../ui/ui_constraints.dart';
import '../ui/ui_rules.dart';
import '../ui/widget_ui.dart';

final rowDefinition = WidgetDefinition(
  id: 'row',
  title: 'Row',
  category: 'Layout',
  description: '子Widgetを横一列に並べるレイアウト',

  previewBuilder: (values) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
      Icon(Icons.star),
      Icon(Icons.favorite),
      Icon(Icons.thumb_up),
    ],
  ),

  miniPreviewBuilder: () => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
      Icon(Icons.star, size: 16),
      Icon(Icons.favorite, size: 16),
      Icon(Icons.thumb_up, size: 16),
    ],
  ),

  ui: WidgetUi(
    rules: UiRules(
      overrides: {
        'mainAxisAlignment': TouchUiType.enumDropdown,
      },
    ),
    constraints: UiConstraints(
      enums: {
        'mainAxisAlignment': const EnumConfig(
          values: [
            'start',
            'center',
            'end',
            'spaceBetween',
            'spaceAround',
            'spaceEvenly',
          ],
        ),
        'crossAxisAlignment': const EnumConfig(
          values: [
            'start',
            'center',
            'end',
            'stretch',
            'baseline',
          ],
        ),
        'mainAxisSize': const EnumConfig(
          values: [
            'min',
            'max',
          ],
        ),
      },
    ),
  ),

  params: [

    WidgetParam(
      name: 'crossAxisAlignment',
      type: 'CrossAxisAlignment',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: false,
      defaultValue: 'center',
      description: '縦方向の配置方法',
      sdkDescription:
      'How the children should be placed along the cross axis.',
    ),

    WidgetParam(
      name: 'mainAxisSize',
      type: 'MainAxisSize',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: false,
      defaultValue: 'max',
      description: '横方向のサイズ',
      sdkDescription:
      'How much space should be occupied in the main axis.',
    ),

    WidgetParam(
      name: 'textDirection',
      type: 'TextDirection?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '並び方向（LTR/RTL）',
      sdkDescription:
      'Determines order in which children are laid out.',
    ),

    WidgetParam(
      name: 'children',
      type: 'List<Widget>',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '子Widget一覧',
      sdkDescription:
      'The widgets below this widget in the tree.',
    ),
  ],
);