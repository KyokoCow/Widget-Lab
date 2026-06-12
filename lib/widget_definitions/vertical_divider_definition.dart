import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

final verticalDividerDefinition = WidgetDefinition(
  id: 'vertical_divider',
  title: 'VerticalDivider',
  category: 'Display',
  parentId: 'StatelessWidget',
  description: '垂直の区切り線を表示するWidget',

  miniPreviewBuilder: () => Container(
    width: 40,
    height: 40,
    color: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: const Center(
      child: VerticalDivider(
        thickness: 2,
        color: Colors.blue,
      ),
    ),
  ),

  previewBuilder: (values) {
    final width =
    (values['width'] ?? 16.0).toDouble();
    final thickness =
    (values['thickness'] ?? 1.0).toDouble();
    final indent =
    (values['indent'] ?? 0.0).toDouble();
    final endIndent =
    (values['endIndent'] ?? 0.0).toDouble();
    final color = Color(
      (values['color'] as num?)?.toInt() ??
          0xFFBDBDBD,
    );

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        border: Border.all(
          color: Colors.blue,
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
              'Parent',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 180,
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 80,
                    alignment: Alignment.center,
                    color: Colors.blue[50],
                    child: const Text('Left'),
                  ),
                  VerticalDivider(
                    width: width,
                    thickness: thickness,
                    indent: indent,
                    endIndent: endIndent,
                    color: color,
                  ),
                  Container(
                    width: 80,
                    alignment: Alignment.center,
                    color: Colors.blue[50],
                    child: const Text('Right'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  },

  touchParams: [
    TouchParam(
      key: 'width',
      uiType: TouchUiType.slider,
      label: 'Width',
      initialValue: 16.0,
      min: 0.0,
      max: 64.0,
    ),

    TouchParam(
      key: 'thickness',
      uiType: TouchUiType.slider,
      label: 'Thickness',
      initialValue: 1.0,
      min: 0.0,
      max: 10.0,
    ),

    TouchParam(
      key: 'indent',
      uiType: TouchUiType.slider,
      label: 'Indent',
      initialValue: 0.0,
      min: 0.0,
      max: 100.0,
    ),

    TouchParam(
      key: 'endIndent',
      uiType: TouchUiType.slider,
      label: 'End Indent',
      initialValue: 0.0,
      min: 0.0,
      max: 100.0,
    ),

    TouchParam(
      key: 'color',
      uiType: TouchUiType.colorPicker,
      label: 'Color',
      initialValue: 0xFFBDBDBD,
    ),
  ],

  params: [
    WidgetParam(
      name: 'width',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'Divider全体の幅（左右の余白を含む領域）',
    ),

    WidgetParam(
      name: 'thickness',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '線の太さ（実際の区切り線の幅）',
    ),

    WidgetParam(
      name: 'indent',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '上側のインデント（開始位置の余白）',
    ),

    WidgetParam(
      name: 'endIndent',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '下側のインデント（終了位置の余白）',
    ),

    WidgetParam(
      name: 'color',
      type: 'Color?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '区切り線の色',
    ),
  ],
);