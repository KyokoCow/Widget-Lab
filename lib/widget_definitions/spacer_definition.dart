import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';

final spacerDefinition = WidgetDefinition(
  id: 'spacer',
  title: 'Spacer',
  category: 'Layout',
  parentId: 'Flexible',
  description: 'Flex(Row・Column・Flex)内で空きスペースを作るためのWidget',
  miniPreviewBuilder: () => const Icon(Icons.space_bar),

  params: [
    WidgetParam(
      name: 'flex',
      type: 'int',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '空きスペースの配分比率を指定する。複数のSpacerがある場合はflexの比率で空き領域を分ける',
    ),
  ],
);