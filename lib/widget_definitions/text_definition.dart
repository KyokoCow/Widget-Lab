import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

final textDefinition = WidgetDefinition(
  id: 'text',
  title: 'Text',
  category: 'Display',
  parentId: 'StatelessWidget',
  description: '文字列を表示するWidget',
  miniPreviewBuilder: () => Container(
    width: 40,
    height: 40,
    color: Colors.white,
    child: const Center(
      child: Text(
        'T',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    ),
  ),

  previewBuilder: (values, previewState) {
    final text = values['data'] ??
        'Flutter Widget Lab\n'
            'This is a preview of the Text widget.';

    final fontSize = (values['fontSize'] ?? 20.0).toDouble();

    final fontWeight = values['fontWeight'] ?? 'normal';
    final fontStyle = values['fontStyle'] ?? 'normal';

    final color = Color(
      (values['color'] as num?)?.toInt() ?? 0xFF000000,
    );

    final backgroundColor = values['backgroundColor'] == null
        ? null
        : Color((values['backgroundColor'] as num).toInt());

    final textAlign = values['textAlign'] ?? 'start';
    final maxLines = (values['maxLines'] as num?)?.toInt() ?? 2;
    final softWrap = values['softWrap'] ?? true;

    final overflow = values['overflow'] ?? 'clip';
    final textScale = (values['textScaler'] ?? 1.0).toDouble();

    final letterSpacing = (values['letterSpacing'] ?? 0.0).toDouble();
    final wordSpacing = (values['wordSpacing'] ?? 0.0).toDouble();
    final height = (values['height'] ?? 1.2).toDouble();

    final decoration = values['decoration'] ?? 'none';
    final decorationColor = values['decorationColor'] == null
        ? null
        : Color((values['decorationColor'] as num).toInt());

    final decorationStyle = values['decorationStyle'] ?? 'solid';
    final decorationThickness =
    (values['decorationThickness'] ?? 1.0).toDouble();

    final textBaseline = values['textBaseline'] ?? 'alphabetic';

    final foregroundMode = values['foregroundMode'] ?? 'none';

    // =========================
    // enum変換
    // =========================
    final FontWeight weight = switch (fontWeight) {
      'bold' => FontWeight.bold,
      _ => FontWeight.normal,
    };

    final FontStyle style = switch (fontStyle) {
      'italic' => FontStyle.italic,
      _ => FontStyle.normal,
    };

    final TextAlign align = switch (textAlign) {
      'center' => TextAlign.center,
      'end' => TextAlign.end,
      _ => TextAlign.start,
    };

    final TextOverflow overflowMode = switch (overflow) {
      'fade' => TextOverflow.fade,
      'ellipsis' => TextOverflow.ellipsis,
      'visible' => TextOverflow.visible,
      _ => TextOverflow.clip,
    };

    final TextDecoration decorationMode = switch (decoration) {
      'underline' => TextDecoration.underline,
      'lineThrough' => TextDecoration.lineThrough,
      'overline' => TextDecoration.overline,
      _ => TextDecoration.none,
    };

    final TextDecorationStyle decorationStyleMode = switch (decorationStyle) {
      'dashed' => TextDecorationStyle.dashed,
      'dotted' => TextDecorationStyle.dotted,
      'double' => TextDecorationStyle.double,
      'wavy' => TextDecorationStyle.wavy,
      _ => TextDecorationStyle.solid,
    };

    final TextBaseline baseline = switch (textBaseline) {
      'ideographic' => TextBaseline.ideographic,
      _ => TextBaseline.alphabetic,
    };

    // =========================
    // foreground生成
    // =========================
    Paint? foreground;

    switch (foregroundMode) {
      case 'solid':
        foreground = Paint()..color = color;
        break;

      case 'gradient':
        foreground = Paint()
          ..shader = const LinearGradient(
            colors: [Colors.purple, Colors.blue, Colors.green],
          ).createShader(const Rect.fromLTWH(0, 0, 260, 80));
        break;

      case 'stroke':
        foreground = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5
          ..color = Colors.black;
        break;

      case 'blend':
        foreground = Paint()
          ..color = Colors.red.withOpacity(0.5)
          ..blendMode = BlendMode.multiply;
        break;

      default:
        foreground = null;
    }

    // =========================
    // TextStyle
    // =========================
    final textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: weight,
      fontStyle: style,
      color: foreground == null ? color : null,
      foreground: foreground,
      backgroundColor: backgroundColor,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decorationMode,
      decorationColor: decorationColor,
      decorationStyle: decorationStyleMode,
      decorationThickness: decorationThickness,
      textBaseline: baseline,
    );

    // =========================
    // UI
    // =========================
    return Center(
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
        child: Container(
          width: 200,
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            style: textStyle,
            textAlign: align,
            maxLines: maxLines,
            softWrap: softWrap,
            overflow: overflowMode,
            textScaler: TextScaler.linear(textScale),
          ),
        ),
      ),
    );
  },

  touchParams: [
    // =========================
    // テキスト本体
    // =========================
    TouchParam(
      key: 'data',
      uiType: TouchUiType.text,
      label: 'Text',
      initialValue: 'Hello Flutter',
    ),

    // =========================
    // レイアウト系
    // =========================
    TouchParam(
      key: 'textAlign',
      uiType: TouchUiType.segmented,
      label: 'Text Align',
      initialValue: 'start',
      items: ['start', 'center', 'end'],
    ),

    TouchParam(
      key: 'maxLines',
      uiType: TouchUiType.discreteSlider,
      label: 'Max Lines',
      initialValue: 1,
      min: 1,
      max: 5,
    ),

    TouchParam(
      key: 'softWrap',
      uiType: TouchUiType.checkbox,
      label: 'Soft Wrap',
      initialValue: true,
    ),

    TouchParam(
      key: 'overflow',
      uiType: TouchUiType.enumDropdown,
      label: 'Overflow',
      initialValue: 'clip',
      items: ['clip', 'fade', 'ellipsis', 'visible'],
    ),

    TouchParam(
      key: 'textScaler',
      uiType: TouchUiType.sliderDouble,
      label: 'Text Scale',
      initialValue: 1.0,
      min: 0.5,
      max: 2.0,
    ),

    // =========================
    // フォント基本
    // =========================
    TouchParam(
      key: 'fontSize',
      uiType: TouchUiType.slider,
      label: 'Font Size',
      initialValue: 20.0,
      min: 8,
      max: 60,
    ),

    TouchParam(
      key: 'fontWeight',
      uiType: TouchUiType.segmented,
      label: 'Font Weight',
      initialValue: 'normal',
      items: ['normal', 'bold'],
    ),

    TouchParam(
      key: 'fontStyle',
      uiType: TouchUiType.segmented,
      label: 'Font Style',
      initialValue: 'normal',
      items: ['normal', 'italic'],
    ),

    TouchParam(
      key: 'fontFamily',
      uiType: TouchUiType.text,
      label: 'Font Family',
      initialValue: '',
    ),

    // =========================
    // 色・背景
    // =========================
    TouchParam(
      key: 'color',
      uiType: TouchUiType.colorPicker,
      label: 'Text Color',
      initialValue: 0xFF000000,
    ),

    TouchParam(
      key: 'backgroundColor',
      uiType: TouchUiType.colorPicker,
      label: 'Background Color',
      initialValue: 0x00000000,
    ),

    // =========================
    // 文字間・行間
    // =========================
    TouchParam(
      key: 'letterSpacing',
      uiType: TouchUiType.slider,
      label: 'Letter Spacing',
      initialValue: 0.0,
      min: -2,
      max: 10,
    ),

    TouchParam(
      key: 'wordSpacing',
      uiType: TouchUiType.slider,
      label: 'Word Spacing',
      initialValue: 0.0,
      min: -2,
      max: 10,
    ),

    TouchParam(
      key: 'height',
      uiType: TouchUiType.sliderDouble,
      label: 'Line Height',
      initialValue: 1.2,
      min: 0.5,
      max: 3.0,
    ),

    // =========================
    // 装飾
    // =========================
    TouchParam(
      key: 'decoration',
      uiType: TouchUiType.segmented,
      label: 'Decoration',
      initialValue: 'none',
      items: ['none', 'underline', 'lineThrough', 'overline'],
    ),

    TouchParam(
      key: 'decorationStyle',
      uiType: TouchUiType.segmented,
      label: 'Decoration Style',
      initialValue: 'solid',
      items: ['solid', 'dashed', 'dotted', 'double', 'wavy'],
    ),

    TouchParam(
      key: 'decorationThickness',
      uiType: TouchUiType.slider,
      label: 'Decoration Thickness',
      initialValue: 1.0,
      min: 0.5,
      max: 5.0,
    ),

    TouchParam(
      key: 'decorationColor',
      uiType: TouchUiType.colorPicker,
      label: 'Decoration Color',
      initialValue: 0xFF000000,
    ),

    // =========================
    // 高度・ベースライン
    // =========================
    TouchParam(
      key: 'textBaseline',
      uiType: TouchUiType.segmented,
      label: 'Text Baseline',
      initialValue: 'alphabetic',
      items: ['alphabetic', 'ideographic'],
    ),

    // =========================
    // 表現系（上級）
    // =========================
    TouchParam(
      key: 'shadow',
      uiType: TouchUiType.checkbox,
      label: 'Enable Shadow',
      initialValue: false,
    ),

    TouchParam(
      key: 'foregroundMode',
      uiType: TouchUiType.segmented,
      label: 'Foreground',
      initialValue: 'none',
      items: [
        'none',
        'solid',
        'gradient',
        'stroke',
        'blend',
      ],
    ),
  ],

  params: [
    WidgetParam(
      name: 'data',
      type: 'String',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.positional,
      nullable: false,
      description: '表示する文字列',
    ),
    WidgetParam(
      name: 'style',
      type: 'TextStyle?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '文字の色やサイズ、太さなどのスタイル',
    ),
    WidgetParam(
      name: 'strutStyle',
      type: 'StrutStyle?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '行の高さやベースラインの設定',
    ),
    WidgetParam(
      name: 'textAlign',
      type: 'TextAlign?',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '文字列の配置方法',
    ),
    WidgetParam(
      name: 'textDirection',
      type: 'TextDirection?',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '文字の表示方向',
    ),
    WidgetParam(
      name: 'locale',
      type: 'Locale?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '文字のロケール',
    ),
    WidgetParam(
      name: 'softWrap',
      type: 'bool?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '必要に応じて自動改行するか',
    ),
    WidgetParam(
      name: 'overflow',
      type: 'TextOverflow?',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '表示領域を超えた場合の表示方法',
    ),
    WidgetParam(
      name: 'textScaler',
      type: 'TextScaler?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '文字サイズの拡大・縮小方法',
    ),
    WidgetParam(
      name: 'maxLines',
      type: 'int?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '表示する最大行数',
    ),
    WidgetParam(
      name: 'semanticsLabel',
      type: 'String?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'スクリーンリーダー用の読み上げテキスト',
    ),
    WidgetParam(
      name: 'textWidthBasis',
      type: 'TextWidthBasis?',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'テキスト幅の計算方法',
    ),
    WidgetParam(
      name: 'textHeightBehavior',
      type: 'TextHeightBehavior?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '行の高さの計算方法',
    ),
    WidgetParam(
      name: 'selectionColor',
      type: 'Color?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'テキスト選択時のハイライト色',
    ),
  ],
);