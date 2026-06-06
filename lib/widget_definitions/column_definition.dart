import 'package:flutter/material.dart';
import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';


final columnDefinition = WidgetDefinition(
    id: 'column',
    title: 'Column',
    category: 'Layout',
    parentId: 'flex',
    description: '子Widgetを縦一列に並べるレイアウト',

    previewBuilder: (values) {
      final mainAxisAlignment =
          values['mainAxisAlignment'] ?? 'spaceEvenly';
      final crossAxisAlignment =
          values['crossAxisAlignment'] ?? 'center';
      final mainAxisSize = values['mainAxisSize'] ?? 'max';
      final verticalDirection = values['verticalDirection'] ?? 'down';
      final textDirection = values['textDirection'] ?? 'ltr';
      final spacing = (values['spacing'] ?? 0).toDouble();

      return Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            child: SizedBox(
              height: null,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Column(
                  mainAxisAlignment: switch (mainAxisAlignment) {
                  'start' => MainAxisAlignment.start,
                  'center' => MainAxisAlignment.center,
                  'end' => MainAxisAlignment.end,
                  'spaceBetween' => MainAxisAlignment.spaceBetween,
                  'spaceAround' => MainAxisAlignment.spaceAround,
                  _ => MainAxisAlignment.spaceEvenly,
                  },
                  crossAxisAlignment: switch (crossAxisAlignment) {
                  'start' => CrossAxisAlignment.start,
                  'center' => CrossAxisAlignment.center,
                  'end' => CrossAxisAlignment.end,
                  'stretch' => CrossAxisAlignment.stretch,
                  _ => CrossAxisAlignment.center,
                  },
                  mainAxisSize: switch (mainAxisSize) {
                  'min' => MainAxisSize.min,
                  _ => MainAxisSize.max,
                  },
                  verticalDirection: switch (verticalDirection) {
                  'up' => VerticalDirection.up,
                  _ => VerticalDirection.down,
                  },
                  textDirection: switch (textDirection) {
                  'rtl' => TextDirection.rtl,
                  _ => TextDirection.ltr,
                  },
                  spacing:spacing,
                  children: [
                    const ColoredBox(
                      color: Colors.red,
                      child: SizedBox(width: 40, height: 20),
                    ),

                    const ColoredBox(
                      color: Colors.green,
                      child: SizedBox(width: 80, height: 20),
                    ),

                    const ColoredBox(
                      color: Colors.blue,
                      child: SizedBox(width: 60, height: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
      );
      },

    miniPreviewBuilder: () => Column(
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
        label: 'MainAxisAlignment (Vertical)',
        initialValue: 'center',
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
        label: 'CrossAxisAlignment (Horizontal)',
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

      TouchParam(
        key: 'textDirection',
        uiType: TouchUiType.enumDropdown,
        label: 'TextDirection',
        initialValue: 'ltr',
        items: ['ltr', 'rtl'],
      ),
    ],


    params: [

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
        name: 'crossAxisAlignment',
        type: 'CrossAxisAlignment',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '横方向の配置方法',
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
        name: 'spacing',
        type: 'double',
        typeKind: TypeKind.primitive,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '子Widget同士の間隔（ピクセル）を指定します。',
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
        name: 'textDirection',
        type: 'TextDirection?',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'start/endの解釈に使用する文字方向',
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
        name: 'clipBehavior',
        type: 'Clip',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: 'はみ出した内容を切り取る方法',
      ),

    ]
);