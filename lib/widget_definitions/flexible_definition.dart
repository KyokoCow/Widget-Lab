import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

final flexibleDefinition = WidgetDefinition(
    id: 'flexible',
    title: 'Flexible',
    category: 'Layout',
    parentId:'ParentDataWidget<FlexParentData>',
    description: 'RowやColumn内で余ったスペースを柔軟に分配するWidget',
    miniPreviewBuilder: () => const Icon(Icons.fit_screen_outlined),

    previewBuilder: (values) {
      final outer =
          (values['flexRatio'] as List<int>?) ?? [1, 1, 1];

      final innerA =
          (values['flexA'] as List<int>?) ?? [1, 1, 1];

      // -------------------------
      // FIT（外側・内側を分離）
      // -------------------------
      final fitOuterRaw =
      (values['fitOuter'] ?? 'FlexFit.tight').toString();

      final fitInnerRaw =
      (values['fitInner'] ?? 'FlexFit.tight').toString();

      final fitOuter = fitOuterRaw == 'FlexFit.loose'
          ? FlexFit.loose
          : FlexFit.tight;

      final fitInner = fitInnerRaw == 'FlexFit.loose'
          ? FlexFit.loose
          : FlexFit.tight;

      // -------------------------
      // FLEX値
      // -------------------------
      final a = outer[0];
      final b = outer[1];
      final c = outer[2];

      final a1 = innerA[0];
      final a2 = innerA[1];
      final a3 = innerA[2];

      return Container(
        width: double.infinity,
        height: 220,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),

        child: Row(
          children: [
            // ------------------
            // A (nested)
            // ------------------
            Flexible(
              flex: a,
              child: Container(
                color: Colors.red.withOpacity(0.15),

                child: Row(
                  children: [
                    Flexible(
                      flex: a1,
                      fit: fitInner,
                      child: SizedBox(
                        height: 60,
                        child: ColoredBox(
                          color: Colors.red.withOpacity(0.25),
                          child: Center(
                            widthFactor: 1,
                            child: Text('A-1'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: a2,
                      fit: fitInner,
                      child: SizedBox(
                        height: 60,
                        child: ColoredBox(
                          color: Colors.red.withOpacity(0.35),
                          child: Center(
                            widthFactor: 1,
                            child: Text('A-2'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: a3,
                      fit: fitInner,
                      child: SizedBox(
                        height: 60,
                        child: ColoredBox(
                          color: Colors.red.withOpacity(0.45),
                          child: Center(
                            widthFactor: 1,
                            child: Text('A-3'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ------------------
            // B
            // ------------------
            Flexible(
              flex: b,
              fit: fitOuter,
              child: Container(
                color: Colors.green.withOpacity(0.2),
                child: SizedBox(
                    width: 40,
                    height: 60,
                    child: ColoredBox(
                      color: Colors.green,
                        child: Center(
                          widthFactor: 1,
                          child: Text('B'),
                        ),
                    ),
                  ),
                ),
              ),


            // ------------------
            // C
            // ------------------
            Flexible(
              flex: c,
              fit: fitOuter,
              child: Container(
                color: Colors.blue.withOpacity(0.2),
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: ColoredBox(
                      color: Colors.blue,
                      child: Center(
                        widthFactor: 1,
                        child: Text('C'),
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
        key: 'flexRatio',
        uiType: TouchUiType.tripleDropdown,
        intItems: [0, 1, 2, 3],
        initialValue: [1, 1, 1],
      ),
      TouchParam(
        key: 'flexA',
        uiType: TouchUiType.tripleDropdown,
        intItems: [0, 1, 2, 3],
        initialValue: [1, 1, 1],
      ),
      TouchParam(
        key: 'fitOuter',
        uiType: TouchUiType.enumDropdown,
        label: 'Fit Outer',
        initialValue: 'FlexFit.tight',
        items: [
          'FlexFit.loose',
          'FlexFit.tight',
        ],
      ),
      TouchParam(
        key: 'fitInner',
        uiType: TouchUiType.enumDropdown,
        label: 'Fit Inner',
        initialValue: 'FlexFit.tight',
        items: [
          'FlexFit.loose',
          'FlexFit.tight',
        ],
      ),
    ],
    params: [
      WidgetParam(
        name: 'child',
        type: 'Widget',
        typeKind: TypeKind.classType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '表示する子Widget',
      ),

      WidgetParam(
        name: 'flex',
        type: 'int',
        typeKind: TypeKind.primitive,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '余ったスペースをどの割合で受け取るか',
      ),

      WidgetParam(
        name: 'fit',
        type: 'FlexFit',
        typeKind: TypeKind.enumType,
        parameterKind: ParameterKind.named,
        nullable: false,
        description: '割り当てられた領域をどのように使用するか',
      ),


    ]
);


