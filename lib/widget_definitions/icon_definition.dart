import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

final iconDefinition = WidgetDefinition(
  id: 'icon',
  title: 'Icon',
  category: 'Display',
  parentId: 'StatelessWidget',
  description: 'Material Designなどのアイコンを表示するWidget',
  miniPreviewBuilder: () => Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, size: 16),
          SizedBox(width: 4),
          Icon(Icons.home, size: 16),
          SizedBox(width: 4),
          Icon(Icons.star, size: 16),
        ],
      ),
      SizedBox(height: 4),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.face, size: 16),
          SizedBox(width: 4),
          Icon(Icons.pets, size: 16),
          SizedBox(width: 4),
          Icon(Icons.cake, size: 16),
        ],
      ),
    ],
  ),

  previewBuilder: (values) {
    final dataset = values['dataset'] ?? 'Material Icons';

    final iconKey = values['icon'] ?? 'favorite';

    final size = (values['size'] ?? 48.0).toDouble();
    final fill = (values['fill'] ?? 0.0).toDouble();
    final weight = (values['weight'] ?? 400.0).toDouble();
    final grade = (values['grade'] ?? 0.0).toDouble();
    final opticalSize = (values['opticalSize'] ?? 24.0).toDouble();
    final showShadow = values['showShadow'] ?? false;
    final colorValue =
        (values['color'] as num?)?.toInt() ?? 0xFF2196F3;

    late final IconData iconData;

    switch (dataset) {
      case 'Material Icons':
        iconData = switch (iconKey) {
          'home' => Icons.home,
          'star' => Icons.star,
          'face' => Icons.face,
          'pets' => Icons.pets,
          'cake' => Icons.cake,
          'android' => Icons.android,
          'flutter_dash' => Icons.flutter_dash,
          _ => Icons.favorite,
        };
        break;

      case 'Material Symbols':
        iconData = switch (iconKey) {
          'home' => Symbols.home,
          'star' => Symbols.star,
          'face' => Symbols.face,
          'pets' => Symbols.pets,
          'cake' => Symbols.cake,
          'android' => Symbols.android,
          'flutter_dash' => Symbols.flutter_dash,
          _ => Symbols.favorite,
        };
        break;

      case 'Cupertino Icons':
        iconData = switch (iconKey) {
          'home' => CupertinoIcons.home,
          'star' => CupertinoIcons.star,
          'face' => CupertinoIcons.person,
          'pets' => CupertinoIcons.paw,
          'cake' => CupertinoIcons.gift,
          'android' => CupertinoIcons.device_phone_portrait,
          'flutter_dash' => CupertinoIcons.bolt,
          _ => CupertinoIcons.heart,
        };
        break;

      default:
        iconData = Icons.favorite;
    }

    return Center(
      child: Icon(
        iconData,
        size: size,
        color: Color(colorValue),

        // Material Symbolsだけ意味を持つ（他は無視される）
        fill: fill,
        weight: weight,
        grade: grade,
        opticalSize: opticalSize,

        shadows: showShadow
            ? const [
          Shadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.black38,
          ),
        ]
            : null,
      ),
    );
  },

  touchParams: [
    TouchParam(
      key: 'dataset',
      uiType: TouchUiType.enumDropdown,
      label: 'Icon Dataset',
      initialValue: 'Material Icons',
      items: const [
        'Material Icons',
        'Material Symbols',
        'Cupertino Icons',
      ],
    ),
    TouchParam(
      key: 'icon',
      uiType: TouchUiType.enumDropdown,
      label: 'Icon',
      initialValue: 'Icons.favorite',
      items: [
        'favorite',
        'home',
        'star',
        'face',
        'pets',
        'cake',
        'android',
        'flutter_dash',
      ],
    ),

    TouchParam(
      key: 'size',
      uiType: TouchUiType.slider,
      label: 'Size',
      initialValue: 48.0,
      min: 16.0,
      max: 128.0,
    ),

    TouchParam(
      key: 'color',
      uiType: TouchUiType.colorPicker,
      label: 'Color',
      initialValue: 0xFF2196F3,
    ),

    TouchParam(
      key: 'fill',
      uiType: TouchUiType.sliderDouble,
      label: 'Fill',
      initialValue: 0.0,
      min: 0.0,
      max: 1.0,
    ),

    TouchParam(
      key: 'weight',
      uiType: TouchUiType.slider,
      label: 'Weight',
      initialValue: 400.0,
      min: 100.0,
      max: 700.0,
    ),

    TouchParam(
      key: 'grade',
      uiType: TouchUiType.slider,
      label: 'Grade',
      initialValue: 0.0,
      min: -25.0,
      max: 200.0,
    ),

    TouchParam(
      key: 'opticalSize',
      uiType: TouchUiType.slider,
      label: 'Optical Size',
      initialValue: 24.0,
      min: 20.0,
      max: 48.0,
    ),

    TouchParam(
      key: 'showShadow',
      uiType: TouchUiType.checkbox,
      label: 'Shadow',
      initialValue: false,
    ),

  ],

  params: [
    WidgetParam(
      name: 'icon',
      type: 'IconData?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.positional,
      nullable: true,
      description: '表示するアイコン',
    ),

    WidgetParam(
      name: 'size',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'アイコンの大きさ',
    ),

    WidgetParam(
      name: 'fill',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '塗りつぶし量（可変フォント対応アイコンで有効）',
    ),

    WidgetParam(
      name: 'weight',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '線の太さ（可変フォント対応アイコンで有効）',
    ),

    WidgetParam(
      name: 'grade',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '線の濃さ（可変フォント対応アイコンで有効）',
    ),

    WidgetParam(
      name: 'opticalSize',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '表示サイズに応じた最適化設定（可変フォント対応アイコンで有効）',
    ),

    WidgetParam(
      name: 'color',
      type: 'Color?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'アイコンの色',
    ),

    WidgetParam(
      name: 'shadows',
      type: 'List<Shadow>?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'アイコンに適用する影',
    ),

    WidgetParam(
      name: 'semanticLabel',
      type: 'String?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'アクセシビリティ用の説明テキスト',
    ),

    WidgetParam(
      name: 'textDirection',
      type: 'TextDirection?',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '左右反転を判断する文字方向',
    ),

    WidgetParam(
      name: 'applyTextScaling',
      type: 'bool?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'テキストスケールに合わせてアイコンサイズを変更するか',
    ),
  ],
);