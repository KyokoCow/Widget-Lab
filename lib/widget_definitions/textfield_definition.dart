import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../touch/touch_category.dart';
import '../ui/touch_ui_type.dart';

final textFieldDefinition = WidgetDefinition(
  id: 'textField',
  title: 'TextField',
  category: 'Input',
  parentId: 'StatefulWidget',
  description: 'ユーザーがテキストを入力できるWidget',

  params: [
    WidgetParam(
      name: 'controller',
      type: 'TextEditingController?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '入力内容を管理するコントローラー',
    ),

    WidgetParam(
      name: 'focusNode',
      type: 'FocusNode?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'フォーカス状態を管理する',
    ),

    WidgetParam(
      name: 'decoration',
      type: 'InputDecoration?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'ラベルや枠線などの装飾',
    ),

    WidgetParam(
      name: 'keyboardType',
      type: 'TextInputType?',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '表示するキーボードの種類',
    ),

    WidgetParam(
      name: 'textInputAction',
      type: 'TextInputAction?',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'キーボードのアクションボタン',
    ),

    WidgetParam(
      name: 'textCapitalization',
      type: 'TextCapitalization',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '自動大文字化の方法',
    ),

    WidgetParam(
      name: 'style',
      type: 'TextStyle?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '入力文字のスタイル',
    ),

    WidgetParam(
      name: 'textAlign',
      type: 'TextAlign',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '文字の配置',
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
      name: 'readOnly',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '読み取り専用にする',
    ),

    WidgetParam(
      name: 'showCursor',
      type: 'bool?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'カーソルを表示するか',
    ),

    WidgetParam(
      name: 'autofocus',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '表示時に自動でフォーカスする',
    ),

    WidgetParam(
      name: 'obscuringCharacter',
      type: 'String',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '伏せ字に使用する文字',
    ),

    WidgetParam(
      name: 'obscureText',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '入力文字を伏せ字で表示する',
    ),

    WidgetParam(
      name: 'enableSuggestions',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '入力候補を表示する',
    ),

    WidgetParam(
      name: 'maxLines',
      type: 'int?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '最大行数',
    ),

    WidgetParam(
      name: 'minLines',
      type: 'int?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '最小行数',
    ),

    WidgetParam(
      name: 'expands',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '親いっぱいに広げる',
    ),

    WidgetParam(
      name: 'maxLength',
      type: 'int?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '入力可能な最大文字数',
    ),

    WidgetParam(
      name: 'enabled',
      type: 'bool?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '入力を有効にする',
    ),

    WidgetParam(
      name: 'cursorWidth',
      type: 'double',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: 'カーソルの太さ',
    ),

    WidgetParam(
      name: 'cursorHeight',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'カーソルの高さ',
    ),

    WidgetParam(
      name: 'cursorRadius',
      type: 'Radius?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'カーソル先端の丸み',
    ),

    WidgetParam(
      name: 'cursorColor',
      type: 'Color?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'カーソルの色',
    ),

    WidgetParam(
      name: 'mouseCursor',
      type: 'MouseCursor?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'マウスカーソルの種類',
    ),

    WidgetParam(
      name: 'scrollPadding',
      type: 'EdgeInsets',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '表示時に確保する余白',
    ),

    WidgetParam(
      name: 'clipBehavior',
      type: 'Clip',
      typeKind: TypeKind.enumType,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '描画範囲の切り抜き方法',
    ),
  ],

  touchParams: [

    // ============================
    // TextField
    // ============================

    TouchParam(
      key: 'keyboardType',
      uiType: TouchUiType.enumDropdown,
      label: 'Keyboard Type',
      initialValue: 'text',
      items: [
        'text',
        'number',
        'phone',
        'emailAddress',
        'url',
        'multiline',
      ],
    ),

    TouchParam(
      key: 'textInputAction',
      uiType: TouchUiType.enumDropdown,
      label: 'Input Action',
      initialValue: 'done',
      items: [
        'done',
        'next',
        'search',
        'send',
        'go',
      ],
    ),

    TouchParam(
      key: 'textAlign',
      uiType: TouchUiType.segmented,
      label: 'Text Align',
      initialValue: 'start',
      items: [
        'start',
        'center',
        'end',
      ],
    ),

    TouchParam(
      key: 'maxLines',
      uiType: TouchUiType.slider,
      label: 'Max Lines',
      initialValue: 1,
      min: 1,
      max: 10,
    ),

    TouchParam(
      key: 'maxLength',
      uiType: TouchUiType.slider,
      label: 'Max Length',
      initialValue: 20,
      min: 1,
      max: 100,
    ),

    TouchParam(
      key: 'cursorWidth',
      uiType: TouchUiType.sliderDouble,
      label: 'Cursor Width',
      initialValue: 2.0,
      min: 1.0,
      max: 10.0,
    ),

    TouchParam(
      key: 'cursorHeight',
      uiType: TouchUiType.sliderDouble,
      label: 'Cursor Height',
      initialValue: 20.0,
      min: 0.0,
      max: 40.0,
    ),

    TouchParam(
      key: 'obscureText',
      uiType: TouchUiType.checkbox,
      label: 'Obscure Text',
      initialValue: false,
    ),

    TouchParam(
      key: 'readOnly',
      uiType: TouchUiType.checkbox,
      label: 'Read Only',
      initialValue: false,
    ),

    TouchParam(
      key: 'enabled',
      uiType: TouchUiType.checkbox,
      label: 'Enabled',
      initialValue: true,
    ),

    TouchParam(
      key: 'autofocus',
      uiType: TouchUiType.checkbox,
      label: 'Autofocus',
      initialValue: false,
    ),

    TouchParam(
      key: 'showCursor',
      uiType: TouchUiType.checkbox,
      label: 'Show Cursor',
      initialValue: true,
    ),

    TouchParam(
      key: 'expands',
      uiType: TouchUiType.checkbox,
      label: 'Expands',
      initialValue: false,
    ),

    TouchParam(
      key: 'textCapitalization',
      uiType: TouchUiType.segmented,
      label: 'Text Capitalization',
      initialValue: 'none',
      items: [
        'none',
        'characters',
        'words',
        'sentences',
      ],
    ),

      TouchParam(
        key: 'minLines',
        uiType: TouchUiType.slider,
        label: 'Min Lines',
        initialValue: 1,
        min: 1,
        max: 10,
      ),

      TouchParam(
        key: 'obscuringCharacter',
        uiType: TouchUiType.text,
        label: 'Obscure Character',
        initialValue: '*',
      ),


    // ============================
    // InputDecoration
    // ============================

    TouchParam(
      key: 'hintText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      label: 'Hint Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'labelText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      label: 'Label Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'helperText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      label: 'Helper Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'errorText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      label: 'Error Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'prefixText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      label: 'Prefix Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'suffixText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      label: 'Suffix Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'counterText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      label: 'Counter Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'filled',
      category: TouchCategory.config,
      uiType: TouchUiType.checkbox,
      label: 'Filled',
      initialValue: false,
    ),

    TouchParam(
      key: 'fillColor',
      category: TouchCategory.config,
      uiType: TouchUiType.colorPicker,
      label: 'Fill Color',
      initialValue: Colors.white,
    ),

    TouchParam(
      key: 'focusColor',
      category: TouchCategory.config,
      uiType: TouchUiType.colorPicker,
      label: 'Focus Color',
      initialValue: Colors.blue,
    ),

    TouchParam(
      key: 'hoverColor',
      category: TouchCategory.config,
      uiType: TouchUiType.colorPicker,
      label: 'Hover Color',
      initialValue: Colors.transparent,
    ),

    TouchParam(
      key: 'isDense',
      category: TouchCategory.config,
      uiType: TouchUiType.checkbox,
      label: 'Dense',
      initialValue: false,
    ),

    TouchParam(
      key: 'isCollapsed',
      category: TouchCategory.config,
      uiType: TouchUiType.checkbox,
      label: 'Collapsed',
      initialValue: false,
    ),

    TouchParam(
      key: 'alignLabelWithHint',
      category: TouchCategory.config,
      uiType: TouchUiType.checkbox,
      label: 'Align Label',
      initialValue: false,
    ),

    TouchParam(
      key: 'borderStyle',
      category: TouchCategory.config,
      uiType: TouchUiType.segmented,
      label: 'Border',
      initialValue: 'outline',
      items: [
        'outline',
        'underline',
        'none',
      ],
    ),

    TouchParam(
      key: 'borderRadius',
      category: TouchCategory.config,
      uiType: TouchUiType.sliderDouble,
      label: 'Border Radius',
      initialValue: 4,
      min: 0,
      max: 32,
    ),

    TouchParam(
      key: 'borderWidth',
      category: TouchCategory.config,
      uiType: TouchUiType.sliderDouble,
      label: 'Border Width',
      initialValue: 1,
      min: 0,
      max: 8,
    ),

    TouchParam(
      key: 'borderColor',
      category: TouchCategory.config,
      uiType: TouchUiType.colorPicker,
      label: 'Border Color',
      initialValue: Colors.grey,
    ),

    TouchParam(
      key: 'contentPaddingHorizontal',
      category: TouchCategory.config,
      uiType: TouchUiType.sliderDouble,
      label: 'Padding H',
      initialValue: 12,
      min: 0,
      max: 32,
    ),

    TouchParam(
      key: 'contentPaddingVertical',
      category: TouchCategory.config,
      uiType: TouchUiType.sliderDouble,
      label: 'Padding V',
      initialValue: 12,
      min: 0,
      max: 32,
    ),

    TouchParam(
      key: 'floatingLabelBehavior',
      category: TouchCategory.config,
      uiType: TouchUiType.segmented,
      label: 'Floating Label',
      initialValue: 'auto',
      items: [
        'auto',
        'always',
        'never',
      ],
    ),

    TouchParam(
      key: 'floatingLabelAlignment',
      category: TouchCategory.config,
      uiType: TouchUiType.segmented,
      label: 'Label Alignment',
      initialValue: 'start',
      items: [
        'start',
        'center',
      ],
    ),

    TouchParam(
      key: 'decorationEnabled',
      category: TouchCategory.config,
      uiType: TouchUiType.checkbox,
      label: 'Decoration Enabled',
      initialValue: true,
    ),
  ],

  previewBuilder: (
      values,
      previewState,
      ) {
    final width =
    (values['width'] ?? 240.0).toDouble();

    previewState.textController ??=
        TextEditingController(
          text: values['text'] ?? '',
        );

    final controller = previewState.textController!;

    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,

        // ------------------
        // TextField
        // ------------------

        textCapitalization:
        switch (values['textCapitalization']) {
          'characters' =>
          TextCapitalization.characters,
          'words' =>
          TextCapitalization.words,
          'sentences' =>
          TextCapitalization.sentences,
          _ =>
          TextCapitalization.none,
        },

        keyboardType: switch (values['keyboardType']) {
          'number' => TextInputType.number,
          'phone' => TextInputType.phone,
          'emailAddress' => TextInputType.emailAddress,
          'url' => TextInputType.url,
          'multiline' => TextInputType.multiline,
          _ => TextInputType.text,
        },

        textInputAction: switch (values['textInputAction']) {
          'next' => TextInputAction.next,
          'search' => TextInputAction.search,
          'send' => TextInputAction.send,
          'go' => TextInputAction.go,
          _ => TextInputAction.done,
        },

        textAlign: switch (values['textAlign']) {
          'center' => TextAlign.center,
          'end' => TextAlign.end,
          _ => TextAlign.start,
        },

        minLines: (values['minLines'] ?? 1).toInt(),

        maxLines: (values['maxLines'] ?? 1).toInt(),

        maxLength: (values['maxLength'] ?? 20).toInt(),

        cursorWidth:
        (values['cursorWidth'] ?? 2.0).toDouble(),

        cursorHeight:
        (values['cursorHeight'] ?? null)?.toDouble(),

        obscuringCharacter:
        (values['obscureCharacter'] ?? '*').toString(),

        obscureText:
        values['obscureText'] ?? false,

        readOnly:
        values['readOnly'] ?? false,

        enabled:
        values['enabled'] ?? true,

        autofocus:
        values['autofocus'] ?? false,

        showCursor:
        values['showCursor'] ?? true,

        expands:
        values['expands'] ?? false,

        // ------------------
        // InputDecoration
        // ------------------

        decoration: InputDecoration(
          hintText: values['hintText'],
          labelText: values['labelText'],
          helperText: values['helperText'],
          errorText: values['errorText'],
          prefixText: values['prefixText'],
          suffixText: values['suffixText'],
          counterText: values['counterText'],

          enabled:
          values['decorationEnabled'] ?? true,

          filled:
          values['filled'] ?? false,

          fillColor: values['fillColor'],
          focusColor: values['focusColor'],
          hoverColor: values['hoverColor'],

          isDense:
          values['isDense'] ?? false,

          isCollapsed:
          values['isCollapsed'] ?? false,

          alignLabelWithHint:
          values['alignLabelWithHint'] ?? false,

          contentPadding: EdgeInsets.symmetric(
            horizontal: (
                values['contentPaddingHorizontal'] ?? 12.0)
                .toDouble(),
            vertical: (
                values['contentPaddingVertical'] ?? 12.0)
                .toDouble(),
          ),

          floatingLabelBehavior:
          switch (values['floatingLabelBehavior']) {
            'always' =>
            FloatingLabelBehavior.always,
            'never' =>
            FloatingLabelBehavior.never,
            _ =>
            FloatingLabelBehavior.auto,
          },

          floatingLabelAlignment:
          switch (values['floatingLabelAlignment']) {
            'center' =>
            FloatingLabelAlignment.center,
            _ =>
            FloatingLabelAlignment.start,
          },

          border: switch (values['borderStyle']) {
            'underline' => UnderlineInputBorder(
              borderRadius: BorderRadius.circular(
                (values['borderRadius'] ?? 4.0)
                    .toDouble(),
              ),
              borderSide: BorderSide(
                color: values['borderColor'] ??
                    Colors.grey,
                width: (
                    values['borderWidth'] ?? 1.0)
                    .toDouble(),
              ),
            ),
            'none' => InputBorder.none,
            _ => OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                (values['borderRadius'] ?? 4.0)
                    .toDouble(),
              ),
              borderSide: BorderSide(
                color: values['borderColor'] ??
                    Colors.grey,
                width: (
                    values['borderWidth'] ?? 1.0)
                    .toDouble(),
              ),
            ),
          },
        ),
      ),
    );
  },

  miniPreviewBuilder: () {
    return const SizedBox(
      width: 120,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'TextField',
        ),
      ),
    );
  },

  codeBuilder: (values) {
    final hintText =
        values['hintText'] ?? '';

    final enabled =
        values['enabled'] ?? true;

    final readOnly =
        values['readOnly'] ?? false;

    return '''
TextField(
  decoration: InputDecoration(
    hintText: '$hintText',
  ),
  enabled: $enabled,
  readOnly: $readOnly,
)
''';
  },
);