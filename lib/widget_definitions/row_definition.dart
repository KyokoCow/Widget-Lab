import 'package:flutter/material.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';
import '../models/widget_definition.dart';
import '../models/widget_param.dart';


final rowDefinition = WidgetDefinition(
  id: 'row',
  title: 'Row',
  category: 'Layout',
  description: '子Widgetを横一列に並べるレイアウト',

    previewBuilder: (values) {
      final mainAxisAlignment =
          values['mainAxisAlignment'] ?? 'spaceEvenly';

      return Container(
        width: 320,
        height: 180,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Row(
          mainAxisAlignment: switch (mainAxisAlignment) {
            'start' => MainAxisAlignment.start,
            'center' => MainAxisAlignment.center,
            'end' => MainAxisAlignment.end,
            'spaceBetween' => MainAxisAlignment.spaceBetween,
            'spaceAround' => MainAxisAlignment.spaceAround,
            _ => MainAxisAlignment.spaceEvenly,
          },
          children: const [
            ColoredBox(
              color: Colors.red,
              child: SizedBox(width: 40, height: 40),
            ),
            ColoredBox(
              color: Colors.green,
              child: SizedBox(width: 40, height: 80),
            ),
            ColoredBox(
              color: Colors.blue,
              child: SizedBox(width: 40, height: 60),
            ),
          ],
        ),
      );
    },

  miniPreviewBuilder: () => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
      Icon(Icons.star, size: 16),
      Icon(Icons.favorite, size: 16),
      Icon(Icons.thumb_up, size: 16),
    ],
  ),

    touchParams: [

      TouchParam(
        key: 'mainAxisAlignment',
        uiType: TouchUiType.enumDropdown,
        label: 'MainAxisAlignment',
        initialValue: 'start',
        items: [
          'start',
          'center',
          'end',
          'spaceBetween',
          'spaceAround',
          'spaceEvenly',
        ],
      ),

      TouchParam(
        key: 'crossAxisAlignment',
        uiType: TouchUiType.enumDropdown,
        label: 'CrossAxisAlignment',
        initialValue: 'center',
        items: [
          'start',
          'center',
          'end',
          'stretch',
        ],
      ),

      TouchParam(
        key: 'mainAxisSize',
        uiType: TouchUiType.enumDropdown,
        label: 'MainAxisSize',
        initialValue: 'max',
        items: [
          'max',
          'min',
        ],
      ),

      TouchParam(
        key: 'spacing',
        uiType: TouchUiType.slider,
        min: 0,
        max: 80,
        initialValue: 0,
      ),

      TouchParam(
        key: 'verticalDirection',
        uiType: TouchUiType.enumDropdown,
        label: 'VerticalDirection',
        initialValue: 'down',
        items: [
          'down',
          'up',
        ],
      ),

    ],



    params: [

      WidgetParam(
        name: 'key',
        type: 'Key?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'Widgetを識別するためのキー',
      ),

      WidgetParam(
        name: 'children',
        type: 'List<Widget>',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '配置する子Widget一覧',
      ),

      WidgetParam(
        name: 'mainAxisAlignment',
        type: 'MainAxisAlignment',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '主軸方向の配置方法',
      ),

      WidgetParam(
        name: 'mainAxisSize',
        type: 'MainAxisSize',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: 'Row自身の横幅の決め方',
      ),

      WidgetParam(
        name: 'crossAxisAlignment',
        type: 'CrossAxisAlignment',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '交差軸方向の配置方法',
      ),

      WidgetParam(
        name: 'textDirection',
        type: 'TextDirection?',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '子Widgetを並べる方向',
      ),

      WidgetParam(
        name: 'verticalDirection',
        type: 'VerticalDirection',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '縦方向でのstart/endの解釈',
      ),

      WidgetParam(
        name: 'textBaseline',
        type: 'TextBaseline?',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'baseline配置時の基準線',
      ),

      WidgetParam(
        name: 'spacing',
        type: 'double',
        typeKind: TypeKind.primitive,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '子Widget間の間隔',
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


    ]
);