import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

final paddingDefinition = WidgetDefinition(
  id: 'padding',
  title: 'Padding',
  category: 'Layout',
  parentId: 'SingleChildRenderObjectWidget',
  description: '子Widgetの周囲に余白を追加するWidget',
  miniPreviewBuilder: () => Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
    ),
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        color: Colors.blue,
      ),
    ),
  ),

    previewBuilder: (values, previewState) {
      final paddingType = values['paddingType'] ?? 'all';
      final onlyDirection = values['onlyDirection'] ?? 'left';

      final all = (values['all'] ?? 16.0).toDouble();
      final horizontal = (values['horizontal'] ?? 16.0).toDouble();
      final vertical = (values['vertical'] ?? 16.0).toDouble();
      final onlyValue = (values['onlyValue'] ?? 16.0).toDouble();
      final left = (values['left'] ?? 16.0).toDouble();
      final top = (values['top'] ?? 16.0).toDouble();
      final right = (values['right'] ?? 16.0).toDouble();
      final bottom = (values['bottom'] ?? 16.0).toDouble();

      final EdgeInsets padding = switch (paddingType) {
        'all' => EdgeInsets.all(all),

        'symmetric' => EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),

        'only' => switch (onlyDirection) {
          'left' => EdgeInsets.only(left: onlyValue),
          'top' => EdgeInsets.only(top: onlyValue),
          'right' => EdgeInsets.only(right: onlyValue),
          'bottom' => EdgeInsets.only(bottom: onlyValue),
          _ => EdgeInsets.only(left: onlyValue),
        },

        'fromLTRB' => EdgeInsets.fromLTRB(
          left,
          top,
          right,
          bottom,
        ),

        _ => EdgeInsets.all(all),
      };

      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Padding'),
            const SizedBox(height: 8),
            Expanded(
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: padding,
                    child: Container(
                      width: 60,
                      height: 60,
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
      key: 'paddingType',
      uiType: TouchUiType.enumDropdown,
      label: 'Padding Type',
      initialValue: 'all',
      items: [
        'all',
        'symmetric',
        'only',
        'fromLTRB',
      ],
    ),

    TouchParam(
      key: 'onlyDirection',
      uiType: TouchUiType.enumDropdown,
      label: 'Only Direction',
      initialValue: 'left',
      items: [
        'left',
        'top',
        'right',
        'bottom',
      ],
      enabled: (values) => values['paddingType'] == 'only',
    ),

// all
    TouchParam(
      key: 'all',
      uiType: TouchUiType.slider,
      label: 'All',
      initialValue: 16.0,
      min: 0,
      max: 50,
      enabled: (values) => values['paddingType'] == 'all',
    ),

// symmetric
    TouchParam(
      key: 'horizontal',
      uiType: TouchUiType.slider,
      label: 'Horizontal',
      initialValue: 16.0,
      min: 0,
      max: 50,
      enabled: (values) => values['paddingType'] == 'symmetric',
    ),

    TouchParam(
      key: 'vertical',
      uiType: TouchUiType.slider,
      label: 'Vertical',
      initialValue: 16.0,
      min: 0,
      max: 50,
      enabled: (values) => values['paddingType'] == 'symmetric',
    ),

    TouchParam(
      key: 'onlyValue',
      uiType: TouchUiType.slider,
      label: 'Only Value',
      initialValue: 16.0,
      min: 0,
      max: 50,
      enabled: (values) => values['paddingType'] == 'only',
    ),

  ],
    params: [
      WidgetParam(
        name: 'padding',
        type: 'EdgeInsetsGeometry',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '子Widgetの周囲に追加する余白',
      ),

      WidgetParam(
        name: 'child',
        type: 'Widget',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: '余白を適用する子Widget',
      ),
    ]
);