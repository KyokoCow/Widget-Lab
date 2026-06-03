import 'package:flutter/material.dart';
import '../models/widget_touchparam.dart';
import '../touch/touch_constants.dart';
import '../ui/touch_ui_type.dart';
import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../ui/ui_constraints.dart';
import '../ui/ui_rules.dart';
import '../ui/widget_ui.dart';

final containerDefinition = WidgetDefinition(
  id: 'container',
  title: 'Container',
  category: 'Layout',
  description: 'サイズや背景色を設定できる箱',


  previewBuilder: (values) {
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



  ui: WidgetUi(
    rules: UiRules(
      overrides: {
        'width': TouchUiType.slider,
      },
    ),
    constraints: UiConstraints(
      sliders: {
        'width': SliderConfig(min: 0, max: 300),
      },
      enums: {
        'clipBehavior': const EnumConfig(
          values: [
            'none',
            'hardEdge',
            'antiAlias',
            'antiAliasWithSaveLayer',
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
      description: 'Widgetを識別するためのキー',
      sdkDescription: '',
    ),

    WidgetParam(
      name: 'alignment',
      type: 'AlignmentGeometry?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'childの配置位置',
      sdkDescription:
      'Align the child within the container.   If non-null, the container will expand to fill its parent and position its  child within itself according to the given value. If the incoming  constraints are unbounded, then the child will be shrink-wrapped instead.   Ignored if child is null.   See also:    * Alignment, a class with convenient constants typically used to     specify an AlignmentGeometry.   * AlignmentDirectional, like Alignment for specifying alignments     relative to text direction.',
    ),

    WidgetParam(
      name: 'padding',
      type: 'EdgeInsetsGeometry?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '内側の余白',
      sdkDescription:
      'Empty space to inscribe inside the decoration. The child, if any, is  placed inside this padding.   This padding is in addition to any padding inherent in the decoration;  see Decoration.padding.',
    ),

    WidgetParam(
      name: 'color',
      type: 'Color?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '背景色',
      sdkDescription:
      'The color to paint behind the child...',
    ),

    WidgetParam(
      name: 'isAntiAlias',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      defaultValue: true,
      description: '境界を滑らかに描画するか',
      sdkDescription: '',
    ),

    WidgetParam(
      name: 'decoration',
      type: 'Decoration?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '背景や枠線などの装飾',
      sdkDescription:
      'The decoration to paint behind the child...',
    ),

    WidgetParam(
      name: 'foregroundDecoration',
      type: 'Decoration?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'childの前面に表示する装飾',
      sdkDescription:
      'The decoration to paint in front of the child.',
    ),

    WidgetParam(
      name: 'width',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '横幅',
      sdkDescription: '',
    ),

    WidgetParam(
      name: 'height',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '高さ',
      sdkDescription: '',
    ),

    WidgetParam(
      name: 'constraints',
      type: 'BoxConstraints?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'サイズ制約',
      sdkDescription:
      'Additional constraints to apply to the child...',
    ),

    WidgetParam(
      name: 'margin',
      type: 'EdgeInsetsGeometry?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '外側の余白',
      sdkDescription:
      'Empty space to surround the decoration and child.',
    ),

    WidgetParam(
      name: 'transform',
      type: 'Matrix4?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '回転や拡大縮小などの変形',
      sdkDescription:
      'The transformation matrix to apply before painting...',
    ),

    WidgetParam(
      name: 'transformAlignment',
      type: 'AlignmentGeometry?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'transformの基準位置',
      sdkDescription:
      'The alignment of the origin...',
    ),

    WidgetParam(
      name: 'child',
      type: 'Widget?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '中に表示するWidget',
      sdkDescription:
      'The child contained by the container...',
    ),

    WidgetParam(
      name: 'clipBehavior',
      type: 'Clip',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: false,
      defaultValue: 'none',
      description: 'はみ出した部分の切り取り方法',
      sdkDescription:
      'The clip behavior when Container.decoration is not null...',
    ),
  ],
);