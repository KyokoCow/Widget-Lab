import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';

final expandedDefinition = WidgetDefinition(
  id: 'expanded',
  title: 'Expanded',
  category: 'Layout',
  parentId: 'Flexible',
  description: 'Flex(Row・Column・Flex)内で利用可能な空き領域を埋めるように子Widgetを広げるWidget',
  miniPreviewBuilder: () => const Icon(Icons.open_in_full),

  params: [
    WidgetParam(
      name: 'child',
      type: 'Widget',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '広げて配置する子Widget',
    ),

    WidgetParam(
      name: 'flex',
      type: 'int',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '空き領域の配分比率を指定する。複数のExpanded/Flexibleがある場合はflexの比率で領域を分ける',
    ),
  ],
);