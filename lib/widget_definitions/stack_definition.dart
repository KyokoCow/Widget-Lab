import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

final stackDefinition = WidgetDefinition(
  id: 'stack',
  title: 'Stack',
  category: 'Layout',
  parentId: 'StatelessWidget',
  description: '複数のWidgetを重ねて配置するWidget',

  miniPreviewBuilder: () => Container(
    width: 40,
    height: 40,
    color: Colors.white,
    child: Center(
      child: SizedBox(
        width: 24,
        height: 24,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 14,
                height: 14,
                color: Colors.blue,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 14,
                height: 14,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    ),
  ),

    previewBuilder: (values, previewState) {
      final alignment = values['alignment'] ?? 'topLeft';
      final fit = values['fit'] ?? 'loose';
      final clipBehavior = values['clipBehavior'] ?? 'hardEdge';

      AlignmentGeometry stackAlignment = switch (alignment) {
        'topCenter' => Alignment.topCenter,
        'topRight' => Alignment.topRight,
        'centerLeft' => Alignment.centerLeft,
        'center' => Alignment.center,
        'centerRight' => Alignment.centerRight,
        'bottomLeft' => Alignment.bottomLeft,
        'bottomCenter' => Alignment.bottomCenter,
        'bottomRight' => Alignment.bottomRight,
        _ => Alignment.topLeft,
      };

      StackFit stackFit = switch (fit) {
        'expand' => StackFit.expand,
        'passthrough' => StackFit.passthrough,
        _ => StackFit.loose,
      };

      Clip clip = switch (clipBehavior) {
        'none' => Clip.none,
        'antiAlias' => Clip.antiAlias,
        'antiAliasWithSaveLayer' => Clip.antiAliasWithSaveLayer,
        _ => Clip.hardEdge,
      };

      return Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
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
                width: 250,
                height: 180,
                color: Colors.white,
                child: Stack(
                  alignment: stackAlignment,
                  fit: stackFit,
                  clipBehavior: clip,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.green[200],
                      alignment: Alignment.center,
                      child: const Text('Base'),
                    ),

                    Positioned(
                      right: -20,
                      bottom: -20,
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.orange,
                        alignment: Alignment.center,
                        child: const Text(
                          'Out',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
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
        key: 'alignment',
        uiType: TouchUiType.enumDropdown,
        label: 'Alignment',
        initialValue: 'topLeft',
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

      TouchParam(
        key: 'fit',
        uiType: TouchUiType.enumDropdown,
        label: 'Fit',
        initialValue: 'loose',
        items: [
          'loose',
          'expand',
          'passthrough',
        ],
      ),

      TouchParam(
        key: 'clipBehavior',
        uiType: TouchUiType.enumDropdown,
        label: 'Clip Behavior',
        initialValue: 'hardEdge',
        items: [
          'none',
          'hardEdge',
          'antiAlias',
          'antiAliasWithSaveLayer',
        ],
      ),
    ],

    params: [
      WidgetParam(
        name: 'alignment',
        type: 'AlignmentGeometry',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: 'Positionedを使用しない子Widgetの配置基準',
      ),

      WidgetParam(
        name: 'fit',
        type: 'StackFit',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: 'Positionedを使用しない子Widgetのサイズの決定方法',
      ),

      WidgetParam(
        name: 'clipBehavior',
        type: 'Clip',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: 'Stackの領域からはみ出した部分の描画方法',
      ),

      WidgetParam(
        name: 'children',
        type: 'List<Widget>',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '重ねて配置する子Widgetのリスト',
      ),
    ]
);