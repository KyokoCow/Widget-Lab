import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

final alignDefinition = WidgetDefinition(
  id: 'align',
  title: 'Align',
  category: 'Layout',
  parentId: 'SingleChildRenderObjectWidget',
  description: '子Widgetを指定した位置に配置するWidget',
  miniPreviewBuilder: () => Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
    ),
    child: Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 12,
        height: 12,
        color: Colors.blue,
      ),
    ),
  ),
  previewBuilder: (values, previewState) {
    final alignmentPreset = values['alignmentPreset'] ?? 'center';
    final alignmentX = (values['alignmentX'] ?? 0.0).toDouble();
    final alignmentY = (values['alignmentY'] ?? 0.0).toDouble();
    final widthFactor = (values['widthFactor'] ?? 1.0).toDouble();
    final heightFactor = (values['heightFactor'] ?? 1.0).toDouble();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('Unconstrained'),
          const SizedBox(height: 8),
          Expanded(
            child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Align(
                  alignment: switch (alignmentPreset) {
                    'topLeft' => Alignment.topLeft,
                    'topCenter' => Alignment.topCenter,
                    'topRight' => Alignment.topRight,
                    'centerLeft' => Alignment.centerLeft,
                    'center' => Alignment.center,
                    'centerRight' => Alignment.centerRight,
                    'bottomLeft' => Alignment.bottomLeft,
                    'bottomCenter' => Alignment.bottomCenter,
                    'bottomRight' => Alignment.bottomRight,
                    'custom' => Alignment(alignmentX, alignmentY),
                    _ => Alignment.center,
                  },
                  widthFactor: widthFactor,
                  heightFactor: heightFactor,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  },
  touchParams: [
    TouchParam(
      key: 'widthFactor',
      uiType: TouchUiType.slider,
      label: 'Width Factor',
      initialValue: 1.0,
      min: 0.5,
      max: 3.0,
    ),
    TouchParam(
      key: 'heightFactor',
      uiType: TouchUiType.slider,
      label: 'Height Factor',
      initialValue: 1.0,
      min: 0.5,
      max: 3.0,
    ),
    TouchParam(
      key: 'alignmentPreset',
      uiType: TouchUiType.enumDropdown,
      label: 'Alignment',
      initialValue: 'center',
      items: [
        'center',
        'topLeft',
        'topCenter',
        'topRight',
        'centerLeft',
        'centerRight',
        'bottomLeft',
        'bottomCenter',
        'bottomRight',
        'custom',
      ],
    ),
    TouchParam(
      key: 'alignmentX',
      uiType: TouchUiType.sliderDouble,
      label: 'Alignment X',
      initialValue: 0.0,
      min: -1.0,
      max: 1.0,
      enabled: (values) =>
      (values['alignmentPreset'] ?? 'center') == 'custom',
    ),

    TouchParam(
      key: 'alignmentY',
      uiType: TouchUiType.sliderDouble,
      label: 'Alignment Y',
      initialValue: 0.0,
      min: -1.0,
      max: 1.0,
      enabled: (values) =>
      (values['alignmentPreset'] ?? 'center') == 'custom',
    ),
  ],
  params: [
    WidgetParam(
      name: 'alignment',
      type: 'AlignmentGeometry',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '子Widgetの配置位置',
    ),
    WidgetParam(
      name: 'widthFactor',
      type: 'double',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '幅を子Widgetの何倍にするか',
    ),
    WidgetParam(
      name: 'heightFactor',
      type: 'double',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '高さを子Widgetの何倍にするか',
    ),
    WidgetParam(
      name: 'child',
      type: 'Widget',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '配置する子Widget',
    ),
  ],
);
