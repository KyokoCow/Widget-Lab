import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../touch/touch_category.dart';
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
      final textDirection = values['textDirection'] ?? 'ltr';
      final usePositioned = values['usePositioned'] ?? false;

      final posTop = (values['posTop'] ?? 20.0).toDouble();
      final posLeft = (values['posLeft'] ?? 20.0).toDouble();

      final posRight = values['posRight'] == null
          ? null
          : (values['posRight'] as num).toDouble();

      final posBottom = values['posBottom'] == null
          ? null
          : (values['posBottom'] as num).toDouble();

      final posWidth = values['posWidth'] == null
          ? null
          : (values['posWidth'] as num).toDouble();

      final posHeight = values['posHeight'] == null
          ? null
          : (values['posHeight'] as num).toDouble();

      final TextDirection direction =
          textDirection == 'rtl' ? TextDirection.rtl : TextDirection.ltr;

      final AlignmentGeometry stackAlignment = switch (alignment) {
        // directional
        'topStart' => AlignmentDirectional.topStart,
        'topEnd' => AlignmentDirectional.topEnd,
        'centerStart' => AlignmentDirectional.centerStart,
        'centerEnd' => AlignmentDirectional.centerEnd,
        'bottomStart' => AlignmentDirectional.bottomStart,
        'bottomEnd' => AlignmentDirectional.bottomEnd,

        // absolute
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

      final StackFit stackFit = switch (fit) {
        'expand' => StackFit.expand,
        'passthrough' => StackFit.passthrough,
        _ => StackFit.loose,
      };

      final Clip clip = switch (clipBehavior) {
        'none' => Clip.none,
        'antiAlias' => Clip.antiAlias,
        'antiAliasWithSaveLayer' => Clip.antiAliasWithSaveLayer,
        _ => Clip.hardEdge,
      };

      Widget base = Container(
        width: 120,
        height: 120,
        color: Colors.pink[200],
        alignment: Alignment.center,
        child: Text(
          usePositioned ? 'B:Positioned' : 'B:Alignment',
        ),
      );

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
          textDirection: direction,
          alignment: stackAlignment,
          fit: stackFit,
          clipBehavior: clip,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Parent',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                'C:Alignment',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            if (!usePositioned)
              base
            else
              Positioned(
                top: posTop,
                left: posLeft,
                right: (values['useRight'] ?? false) ? posRight : null,
                bottom: (values['useBottom'] ?? false) ? posBottom : null,
                width: (values['useRight'] ?? false) ? null : posWidth,
                height: (values['useBottom'] ?? false) ? null : posHeight,
                child: Container(
                  color: Colors.pink[200],
                  alignment: Alignment.center,
                  child: const Text('B:Positioned'),
                ),
              ),
            Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: const Offset(20, 20),
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text(
                    'A:Align',
                    style: TextStyle(
                      fontSize: 10,
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
        key: 'useDirectionalAlignment',
        uiType: TouchUiType.checkbox,
        category: TouchCategory.config,
        label: 'Use Directional Alignment',
        initialValue: false,
      ),
      TouchParam(
        key: 'alignment',
        uiType: TouchUiType.enumDropdown,
        label: 'Alignment',
        initialValue: 'topLeft',
        itemsProvider: (values) {
          final directional = values['useDirectionalAlignment'] ?? false;

          if (directional) {
            return [
              'topStart',
              'topCenter',
              'topEnd',
              'centerStart',
              'center',
              'centerEnd',
              'bottomStart',
              'bottomCenter',
              'bottomEnd',
            ];
          }

          return [
            'topLeft',
            'topCenter',
            'topRight',
            'centerLeft',
            'center',
            'centerRight',
            'bottomLeft',
            'bottomCenter',
            'bottomRight',
          ];
        },
      ),
      TouchParam(
        key: 'textDirection',
        uiType: TouchUiType.segmented,
        label: 'Text Direction',
        initialValue: 'ltr',
        items: [
          'ltr',
          'rtl',
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
      TouchParam(
        key: 'usePositioned',
        uiType: TouchUiType.checkbox,
        category: TouchCategory.config,
        label: 'Use Positioned(Container B)',
        initialValue: false,
      ),
      TouchParam(
        key: 'useRight',
        uiType: TouchUiType.checkbox,
        category: TouchCategory.config,
        label: 'Use Right',
        initialValue: false,
        enabled: (values) => values['usePositioned'] ?? false,
      ),
      TouchParam(
        key: 'useBottom',
        uiType: TouchUiType.checkbox,
        category: TouchCategory.config,
        label: 'Use Bottom',
        initialValue: false,
        enabled: (values) => values['usePositioned'] ?? false,
      ),
      TouchParam(
        key: 'posTop',
        uiType: TouchUiType.slider,
        category: TouchCategory.config,
        label: 'Top',
        initialValue: 20.0,
        min: -100.0,
        max: 200.0,
        enabled: (values) => values['usePositioned'] ?? false,
      ),
      TouchParam(
        key: 'posLeft',
        uiType: TouchUiType.slider,
        category: TouchCategory.config,
        label: 'Left',
        initialValue: 20.0,
        min: -100.0,
        max: 200.0,
        enabled: (values) => values['usePositioned'] ?? false,
      ),
      TouchParam(
        key: 'posRight',
        uiType: TouchUiType.slider,
        category: TouchCategory.config,
        label: 'Right',
        initialValue: 20.0,
        min: -100.0,
        max: 300.0,
        enabled: (values) =>
            (values['usePositioned'] ?? false) && (values['useRight'] ?? false),
      ),
      TouchParam(
        key: 'posBottom',
        uiType: TouchUiType.slider,
        category: TouchCategory.config,
        label: 'Bottom',
        initialValue: 20.0,
        min: -100.0,
        max: 200.0,
        enabled: (values) =>
            (values['usePositioned'] ?? false) &&
            (values['useBottom'] ?? false),
      ),
      TouchParam(
        key: 'posWidth',
        uiType: TouchUiType.slider,
        category: TouchCategory.config,
        label: 'Width',
        initialValue: 120.0,
        min: 20.0,
        max: 250.0,
        enabled: (values) =>
            (values['usePositioned'] ?? false) &&
            !(values['useRight'] ?? false),
      ),
      TouchParam(
        key: 'posHeight',
        uiType: TouchUiType.slider,
        category: TouchCategory.config,
        label: 'Height',
        initialValue: 120.0,
        min: 20.0,
        max: 180.0,
        enabled: (values) =>
            (values['usePositioned'] ?? false) &&
            !(values['useBottom'] ?? false),
      ),
      TouchParam(
        key: 'fit',
        uiType: TouchUiType.segmented,
        label: 'Fit',
        initialValue: 'loose',
        items: [
          'loose',
          'expand',
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
        name: 'textDirection',
        type: 'TextDirection?',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: true,
        description: 'start/endの解釈に使用する文字方向',
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
    ]);
