import 'package:flutter/material.dart';
import '../models/widget_touchparam.dart';
import '../touch/touch_constants.dart';
import '../ui/touch_ui_type.dart';
import '../models/widget_definition.dart';
import '../models/widget_param.dart';


final containerDefinition = WidgetDefinition(
  id: 'container',
  title: 'Container',
  category: 'Layout',
  parentId: 'stateless_widget',
  description: 'サイズや背景色を設定できる箱',


  previewBuilder: (values,previewState) {
    final width = (values['width'] ?? 100).toDouble();
    final height = (values['height'] ?? 80).toDouble();

    final innerSize = 40.0;
    final borderEnabled =
        values['borderEnabled'] ?? true;
    final borderWidth =
    (values['borderWidth'] ?? 1).toDouble();
    final padding =
    (values['padding'] ?? 0).toDouble();
    final margin =
    (values['margin'] ?? 0).toDouble();
    final borderRadius =
    (values['borderRadius'] ?? 0).toDouble();
    final alignment =
        alignmentMap[values['alignment']]
            ?? Alignment.center;



    return Container(
      width: double.infinity,
      height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blue[100], // 薄い青（塗りつぶし）
            border: Border.all(
              color: Colors.blue[800]!, // 濃い青（枠線）
              width: 2,
            ),
         ),
      margin: const EdgeInsets.all(20),
      child: Stack(
        children: [
          const Positioned(
            top: 8,
            left: 8,
            child: Text(
              "Parent",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Center(
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(borderRadius),
                border: borderEnabled
                    ? Border.all(
                  color: Colors.black,
                  width: borderWidth,
                )
                    : null,
              ),
              padding: EdgeInsets.all(padding),
              margin: EdgeInsets.all(margin),
              alignment: alignment,
              child:Container(
                    width: innerSize,
                    height: innerSize,
                    color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Child",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 8,
                        ),
                      ),
                      Text(
                        "${innerSize.toInt()}x${innerSize.toInt()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 8,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

        ],

      ),
    );
  },

  miniPreviewBuilder: () => Container(
    width: 40,
    height: 40,
    color: Colors.blue,
  ),

  codeBuilder: (values) {
    final width = (values['width'] as double? ?? 100).toInt();
    final height = (values['height'] as double? ?? 80).toInt();

    final clip = values['clipBehavior'] ?? 'none';

    final clipBehavior = switch (clip) {
      'antiAlias' => 'Clip.antiAlias',
      'hardEdge' => 'Clip.hardEdge',
      'antiAliasWithSaveLayer' => 'Clip.antiAliasWithSaveLayer',
      _ => 'Clip.none',
    };

    return '''
Container(
  width: $width,
  height: $height,
  color: Colors.blue,
  clipBehavior: $clipBehavior,
)
''';
  },
  touchParams: [
    TouchParam(
      key: 'width',
      uiType: TouchUiType.slider,
      min: 20,
      max: 300,
      initialValue: 100,
    ),

    TouchParam(
      key: 'height',
      uiType: TouchUiType.slider,
      min: 20,
      max: 300,
      initialValue: 80,
    ),

    TouchParam(
      key: 'borderEnabled',
      uiType: TouchUiType.checkbox,
      initialValue: true,
    ),

    TouchParam(
      key: 'borderWidth',
      uiType: TouchUiType.slider,
      min: 0,
      max: 10,
      initialValue: 1,
    ),

    // Padding
    TouchParam(
      key: 'padding',
      uiType: TouchUiType.slider,
      min: 0,
      max: 50,
      initialValue: 0,
    ),

    // Margin
    TouchParam(
      key: 'margin',
      uiType: TouchUiType.slider,
      min: 0,
      max: 50,
      initialValue: 0,
    ),

    // BorderRadius
    TouchParam(
      key: 'borderRadius',
      uiType: TouchUiType.slider,
      min: 0,
      max: 50,
      initialValue: 0,
    ),
    TouchParam(
      key: 'alignment',
      uiType: TouchUiType.enumDropdown,
      label:'Alignment',
      initialValue: 'center',
      items: [
        'topLeft',
        'topCenter',
        'topRight',

        'centerLeft',
        'center',
        'centerRight',

        'bottomLeft',
        'bottomCenter',
        'bottomRight',
      ],
    ),


  ],


    params: [

      WidgetParam(
        name: 'child',
        type: 'Widget?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '中に配置する子Widget',
      ),


      WidgetParam(
        name: 'alignment',
        type: 'AlignmentGeometry?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'childの配置位置',
      ),

      WidgetParam(
        name: 'padding',
        type: 'EdgeInsetsGeometry?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'childの内側余白',
      ),

      WidgetParam(
        name: 'color',
        type: 'Color?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '背景色',
      ),

      WidgetParam(
        name: 'decoration',
        type: 'Decoration?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '背景や枠線などの装飾',
      ),

      WidgetParam(
        name: 'foregroundDecoration',
        type: 'Decoration?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'childの前面に描画する装飾',
      ),

      WidgetParam(
        name: 'width',
        type: 'double?',
        typeKind: TypeKind.primitive,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '横幅',
      ),

      WidgetParam(
        name: 'height',
        type: 'double?',
        typeKind: TypeKind.primitive,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '高さ',
      ),

      WidgetParam(
        name: 'constraints',
        type: 'BoxConstraints?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'サイズ制約',
      ),

      WidgetParam(
        name: 'margin',
        type: 'EdgeInsetsGeometry?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '外側余白',
      ),

      WidgetParam(
        name: 'transform',
        type: 'Matrix4?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '変形行列',
      ),

      WidgetParam(
        name: 'transformAlignment',
        type: 'AlignmentGeometry?',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '変形の基準位置',
      ),

      WidgetParam(
        name: 'clipBehavior',
        type: 'Clip',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: 'はみ出した内容の切り取り方法',
      ),

    ]
);