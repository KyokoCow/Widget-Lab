import 'package:flutter/material.dart';
import '../ui/touch_ui_type.dart';
import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../ui/ui_constraints.dart';
import '../ui/ui_rules.dart';
import '../ui/widget_ui.dart';

final columnDefinition = WidgetDefinition(
    id: 'column',
    title: 'column',
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
        name: 'key',
        type: 'Key?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'Widgetを識別するキー',
      ),

      WidgetParam(
        name: 'children',
        type: 'List<Widget>',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: 'Columnの子Widget一覧',
      ),

      WidgetParam(
        name: 'mainAxisAlignment',
        type: 'MainAxisAlignment',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '縦方向の配置方法',
      ),

      WidgetParam(
        name: 'mainAxisSize',
        type: 'MainAxisSize',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '縦方向にどれだけスペースを使うか',
      ),

      WidgetParam(
        name: 'crossAxisAlignment',
        type: 'CrossAxisAlignment',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '横方向の配置方法',
      ),

      WidgetParam(
        name: 'textDirection',
        type: 'TextDirection?',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'start/endの解釈に使用する文字方向',
      ),

      WidgetParam(
        name: 'verticalDirection',
        type: 'VerticalDirection',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '子Widgetを上から下か下から上に並べるか',
      ),

      WidgetParam(
        name: 'textBaseline',
        type: 'TextBaseline?',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'baseline揃えを行う場合の基準線',
      ),

      WidgetParam(
        name: 'spacing',
        type: 'double',
        typeKind: TypeKind.primitive,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '子Widget同士の間隔',
      ),


      // ===== 継承プロパティ =====

      WidgetParam(
        name: 'clipBehavior',
        type: 'Clip',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.inherited,
        nullable: false,
        description: 'はみ出した内容を切り取る方法',
      ),

      WidgetParam(
        name: 'direction',
        type: 'Axis',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.inherited,
        nullable: false,
        description: '主軸方向',
      ),
    ]
);