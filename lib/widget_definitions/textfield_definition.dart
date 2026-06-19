import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../touch/touch_category.dart';
import '../ui/touch_ui_type.dart';
import '../utils/build_icon.dart';
import '../utils/icon_utils.dart';
import '../utils/safe_value.dart';

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
    WidgetParam(
      name: 'cursorOpacityAnimates',
      type: 'bool?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'カーソルをフェードアニメーションで点滅させるか',
    ),
    WidgetParam(
      name: 'ignorePointers',
      type: 'bool?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'ポインター操作を無視するか',
    ),
    WidgetParam(
      name: 'buildCounter',
      type: 'InputCounterWidgetBuilder?',
      typeKind: TypeKind.functionType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '入力文字数カウンターの表示方法をカスタマイズ',
    ),
  ],
  touchParams: [
    // ============================
    // TextField
    // ============================

    TouchParam(
      key: 'keyboardType',
      uiType: TouchUiType.enumDropdown,
      listCategory: TouchListCategory.keyboard,
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
      listCategory: TouchListCategory.keyboard,
      label: 'Text Input Action',
      initialValue: 'done',
      itemsProvider: (values) {
        final keyboardType = values['keyboardType'];
        final maxLines = values['maxLines'] ?? 1;

        final items = [
          'done',
          'next',
          'previous',
          'search',
          'send',
          'go',
        ];

        if (keyboardType == 'multiline' || maxLines != 1) {
          items.add('newline');
        }

        return items;
      },
    ),

    TouchParam(
      key: 'textDirection',
      category: TouchCategory.config,
      uiType: TouchUiType.segmented,
      listCategory: TouchListCategory.text,
      label: 'Text Direction',
      initialValue: 'ltr',
      items: [
        'ltr',
        'rtl',
      ],
    ),

    TouchParam(
      key: 'textAlign',
      uiType: TouchUiType.enumDropdown,
      listCategory: TouchListCategory.text,
      label: 'Text Align',
      initialValue: 'start',
      items: [
        'start',
        'end',
        'left',
        'right',
        'center',
        'justify',
      ],
    ),

    TouchParam(
      key: 'textAlignVertical',
      category: TouchCategory.config,
      uiType: TouchUiType.enumDropdown,
      listCategory: TouchListCategory.text,
      label: 'Text Align Vertical',
      initialValue: 'center',
      items: [
        'top',
        'center',
        'bottom',
      ],
    ),

    TouchParam(
      key: 'minLines',
      uiType: TouchUiType.discreteSlider,
      listCategory: TouchListCategory.field,
      label: 'Min Lines',
      initialValue: 1,
      min: 1,
      max: 10,
      enabled: (values) =>
          !(values['obscureText'] ?? false) && !(values['expands'] ?? false),
      maxProvider: (values) => values['maxLines'] ?? 10,
    ),

    TouchParam(
      key: 'maxLines',
      uiType: TouchUiType.discreteSlider,
      listCategory: TouchListCategory.field,
      label: 'Max Lines',
      initialValue: 1,
      min: 1,
      max: 10,
      enabled: (values) =>
          !(values['obscureText'] ?? false) && !(values['expands'] ?? false),
      minProvider: (values) => values['minLines'] ?? 1,
    ),

    TouchParam(
      key: 'maxLength',
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.inputRule,
      label: 'Max Length',
      initialValue: 20,
      min: 1,
      max: 100,
    ),

    TouchParam(
      key: 'cursorWidth',
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.cursor,
      label: 'Cursor Width',
      initialValue: 2.0,
      min: 1.0,
      max: 10.0,
    ),

    TouchParam(
      key: 'cursorHeight',
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.cursor,
      label: 'Cursor Height',
      initialValue: 20.0,
      min: 0.0,
      max: 40.0,
    ),

    TouchParam(
      key: 'obscureText',
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.inputRule,
      label: 'Obscure Text',
      initialValue: false,
      enabled: (values) => !(values['expands'] ?? false),
    ),

    TouchParam(
      key: 'readOnly',
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.inputRule,
      label: 'Read Only',
      initialValue: false,
    ),

    TouchParam(
      key: 'enabled',
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.inputRule,
      label: 'Enabled',
      initialValue: true,
    ),

    TouchParam(
      key: 'ignorePointers',
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.inputRule,
      label: 'Ignore Pointers',
      initialValue: false,
    ),

    TouchParam(
      key: 'showCursor',
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.cursor,
      label: 'Show Cursor',
      initialValue: true,
    ),

    TouchParam(
      key: 'expands',
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.field,
      label: 'Expands',
      initialValue: false,
      enabled: (values) => !(values['obscureText'] ?? false),
    ),

    TouchParam(
      key: 'textCapitalization',
      uiType: TouchUiType.enumDropdown,
      listCategory: TouchListCategory.keyboard,
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
      key: 'obscuringCharacter',
      uiType: TouchUiType.text,
      listCategory: TouchListCategory.inputRule,
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
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Hint Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'labelText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Label Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'helperText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Helper Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'errorText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Error Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'prefixText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Prefix Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'suffixText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Suffix Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'counterText',
      category: TouchCategory.config,
      uiType: TouchUiType.text,
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Counter Text',
      initialValue: '',
    ),

    TouchParam(
      key: 'buildCounter',
      category: TouchCategory.config,
      uiType: TouchUiType.segmented,
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Build Counter',
      initialValue: 'default',
      items: [
        'default',
        'hidden',
        'original',
      ],
    ),

    TouchParam(
      key: 'filled',
      category: TouchCategory.config,
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.field,
      label: 'Filled',
      initialValue: false,
    ),

    TouchParam(
      key: 'fillColor',
      category: TouchCategory.config,
      uiType: TouchUiType.colorPicker,
      listCategory: TouchListCategory.field,
      label: 'Fill Color',
      initialValue: Colors.white,
    ),

    TouchParam(
      key: 'isDense',
      category: TouchCategory.config,
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.field,
      label: 'Dense',
      initialValue: false,
    ),

    TouchParam(
      key: 'isCollapsed',
      category: TouchCategory.config,
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.field,
      label: 'Collapsed',
      initialValue: false,
    ),

    TouchParam(
      key: 'alignLabelWithHint',
      category: TouchCategory.config,
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Align Label',
      initialValue: false,
    ),

    TouchParam(
      key: 'borderStyle',
      category: TouchCategory.config,
      uiType: TouchUiType.segmented,
      listCategory: TouchListCategory.field,
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
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.field,
      label: 'Border Radius',
      initialValue: 4,
      min: 0,
      max: 32,
    ),

    TouchParam(
      key: 'borderWidth',
      category: TouchCategory.config,
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.field,
      label: 'Border Width',
      initialValue: 1,
      min: 0,
      max: 8,
    ),

    TouchParam(
      key: 'useDefaultErrorBorder',
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.field,
      label: 'Use Default Error Border',
      initialValue: true,
    ),

    TouchParam(
      key: 'useDefaultFocusedErrorBorder',
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.field,
      label: 'Use Default Focused Error Border',
      initialValue: true,
    ),

    TouchParam(
      key: 'borderColor',
      category: TouchCategory.config,
      uiType: TouchUiType.colorPicker,
      listCategory: TouchListCategory.field,
      label: 'Border Color',
      initialValue: Colors.grey,
    ),

    TouchParam(
      key: 'contentPaddingHorizontal',
      category: TouchCategory.config,
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.field,
      label: 'Padding H',
      initialValue: 12,
      min: 0,
      max: 32,
      enabled: (values) => !(values['isDense'] ?? false),
    ),

    TouchParam(
      key: 'contentPaddingVertical',
      category: TouchCategory.config,
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.field,
      label: 'Padding V',
      initialValue: 12,
      min: 0,
      max: 32,
      enabled: (values) => !(values['isDense'] ?? false),
    ),

    TouchParam(
      key: 'floatingLabelBehavior',
      category: TouchCategory.config,
      uiType: TouchUiType.segmented,
      listCategory: TouchListCategory.placeholderLabel,
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
      listCategory: TouchListCategory.placeholderLabel,
      label: 'Label Alignment',
      initialValue: 'start',
      items: [
        'start',
        'center',
      ],
    ),

    // TouchParam(
    //   key: 'decorationEnabled',
    //   category: TouchCategory.config,
    //   uiType: TouchUiType.checkbox,
    //   listCategory: TouchListCategory.field,
    //   label: 'Decoration Enabled',
    //   initialValue: true,
    // ),

    TouchParam(
      key: 'cursorRadius',
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.cursor,
      label: 'Cursor Radius',
      initialValue: 0.0,
      min: 0.0,
      max: 16.0,
    ),

    TouchParam(
      key: 'cursorOpacityAnimates',
      uiType: TouchUiType.checkbox,
      listCategory: TouchListCategory.cursor,
      label: 'Cursor Opacity Animates',
      initialValue: true,
    ),


    TouchParam(
      key: 'fontSize',
      category: TouchCategory.config,
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.text,
      label: 'Font Size',
      initialValue: 16.0,
      min: 8.0,
      max: 40.0,
    ),

    TouchParam(
      key: 'fontWeight',
      category: TouchCategory.config,
      uiType: TouchUiType.segmented,
      listCategory: TouchListCategory.text,
      label: 'Font Weight',
      initialValue: 'normal',
      items: [
        'normal',
        'bold',
      ],
    ),

    TouchParam(
      key: 'fontStyle',
      category: TouchCategory.config,
      uiType: TouchUiType.segmented,
      listCategory: TouchListCategory.text,
      label: 'Font Style',
      initialValue: 'normal',
      items: [
        'normal',
        'italic',
      ],
    ),

    TouchParam(
      key: 'textColor',
      category: TouchCategory.config,
      uiType: TouchUiType.colorPicker,
      listCategory: TouchListCategory.text,
      label: 'Text Color',
      initialValue: Colors.black.value,
    ),

    TouchParam(
      key: 'letterSpacing',
      category: TouchCategory.config,
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.text,
      label: 'Letter Spacing',
      initialValue: 0.0,
      min: -2.0,
      max: 10.0,
    ),

    TouchParam(
      key: 'wordSpacing',
      category: TouchCategory.config,
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.text,
      label: 'Word Spacing',
      initialValue: 0.0,
      min: 0.0,
      max: 20.0,
    ),

    TouchParam(
      key: 'textHeight',
      category: TouchCategory.config,
      uiType: TouchUiType.slider,
      listCategory: TouchListCategory.text,
      label: 'Line Height',
      initialValue: 1.0,
      min: 0.5,
      max: 3.0,
    ),

    TouchParam(
      key: 'prefixIcon',
      category: TouchCategory.config,
      uiType: TouchUiType.iconPicker,
      listCategory: TouchListCategory.icon,
      label: 'Prefix Icon',
      initialValue: 'none',
      items: kDefaultIconItems,
    ),

    TouchParam(
      key: 'suffixIcon',
      category: TouchCategory.config,
      uiType: TouchUiType.iconPicker,
      listCategory: TouchListCategory.icon,
      label: 'Suffix Icon',
      initialValue: 'none',
      items: kDefaultIconItems,
    ),

    TouchParam(
      key: 'icon',
      category: TouchCategory.config,
      uiType: TouchUiType.iconPicker,
      listCategory: TouchListCategory.icon,
      label: 'Icon',
      initialValue: 'none',
      items: kDefaultIconItems,
    ),
  ],
  previewBuilder: (
    values,
    previewState,
  ) {
    final width = (values['width'] ?? 240.0).toDouble();

    previewState.textController ??= TextEditingController(
      text: values['text'] ?? '',
    );
    previewState.focusNode ??= FocusNode();

    String _currentBorder({
      required bool hasError,
      required bool enabled,
      required bool focused,
    }) {
      if (!enabled) {
        return 'disabledBorder';
      }

      if (hasError && focused) {
        return 'focusedErrorBorder';
      }

      if (hasError) {
        return 'errorBorder';
      }

      if (focused) {
        return 'focusedBorder';
      }

      return 'enabledBorder';
    }

    final controller = previewState.textController!;
    final expands = values['expands'] ?? false;
    final obscureText = values['obscureText'] ?? false;
    final minLines = obscureText
        ? 1
        : expands
            ? null
            : (values['minLines'] ?? 1).toInt();

    final maxLines = obscureText
        ? 1
        : expands
            ? null
            : (values['maxLines'] ?? 1).toInt();

    final isDense = values['isDense'] ?? false;

    final keyboardTypeValue = values['keyboardType'];

    final textInputActionValue = values['textInputAction'];

    final keyboardType = textInputActionValue == 'newline' && maxLines != 1
        ? TextInputType.multiline
        : switch (keyboardTypeValue) {
            'number' => TextInputType.number,
            'phone' => TextInputType.phone,
            'emailAddress' => TextInputType.emailAddress,
            'url' => TextInputType.url,
            'multiline' => TextInputType.multiline,
            _ => TextInputType.text,
          };
    final obscuringCharacter =
    (values['obscuringCharacter'] ?? '*').toString();

    final safeObscuringCharacter =
    obscuringCharacter.runes.length == 1
        ? obscuringCharacter
        : '*';

    final customBorder = switch (values['borderStyle']) {
      'underline' => UnderlineInputBorder(
        borderRadius: BorderRadius.circular(
          (values['borderRadius'] ?? 4.0).toDouble(),
        ),
        borderSide: BorderSide(
          color: safeColor(
            values['borderColor'],
            fallback: Colors.grey,
          ),
          width: (values['borderWidth'] ?? 1.0).toDouble(),
        ),
      ),
      'none' => InputBorder.none,
      _ => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          (values['borderRadius'] ?? 4.0).toDouble(),
        ),
        borderSide: BorderSide(
          color: safeColor(
            values['borderColor'],
            fallback: Colors.grey,
          ),
          width: (values['borderWidth'] ?? 1.0).toDouble(),
        ),
      ),
    };

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Text(
            '使用中: ${_currentBorder(
              hasError: (values['errorText'] ?? '').toString().isNotEmpty,
              enabled: values['enabled'] ?? true,
              focused: previewState.isFocused,
            )}',
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: previewState.focusNode,

              // ------------------
              // TextField
              // ------------------

              textCapitalization: switch (values['textCapitalization']) {
                'characters' => TextCapitalization.characters,
                'words' => TextCapitalization.words,
                'sentences' => TextCapitalization.sentences,
                _ => TextCapitalization.none,
              },

              keyboardType: keyboardType,

              textInputAction: switch (values['textInputAction']) {
                'next' => TextInputAction.next,
                'previous' => TextInputAction.previous,
                'search' => TextInputAction.search,
                'send' => TextInputAction.send,
                'go' => TextInputAction.go,
                'newline' => TextInputAction.newline,
                _ => TextInputAction.done,
              },

              textAlign: switch (values['textAlign']) {
                'left' => TextAlign.left,
                'right' => TextAlign.right,
                'center' => TextAlign.center,
                'justify' => TextAlign.justify,
                'end' => TextAlign.end,
                _ => TextAlign.start,
              },

              textAlignVertical: switch (values['textAlignVertical']) {
                'top' => TextAlignVertical.top,
                'bottom' => TextAlignVertical.bottom,
                _ => TextAlignVertical.center,
              },

              textDirection: switch (values['textDirection']) {
                'rtl' => TextDirection.rtl,
                _ => TextDirection.ltr,
              },

              style: TextStyle(
                fontSize: (values['fontSize'] ?? 16.0).toDouble(),
                color: safeColor(
                  values['textColor'],
                  fallback: Colors.black,
                ),
                fontWeight: switch (values['fontWeight']) {
                  'bold' => FontWeight.bold,
                  _ => FontWeight.normal,
                },
                fontStyle: switch (values['fontStyle']) {
                  'italic' => FontStyle.italic,
                  _ => FontStyle.normal,
                },
                letterSpacing: (values['letterSpacing'] ?? 0.0).toDouble(),
                wordSpacing: (values['wordSpacing'] ?? 0.0).toDouble(),
                height: (values['textHeight'] ?? 1.0).toDouble(),
              ),

              expands: expands,
              minLines: minLines,
              maxLines: maxLines,

              maxLength: (values['maxLength'] ?? 20).toInt(),

              cursorWidth: (values['cursorWidth'] ?? 2.0).toDouble(),

              cursorHeight: (values['cursorHeight'] ?? null)?.toDouble(),

              obscuringCharacter: safeObscuringCharacter,

              obscureText: values['obscureText'] ?? false,

              readOnly: values['readOnly'] ?? false,

              enabled: values['enabled'] ?? true,

              showCursor: values['showCursor'] ?? true,

              cursorRadius: Radius.circular(
                (values['cursorRadius'] ?? 0.0).toDouble(),
              ),

              cursorOpacityAnimates: values['cursorOpacityAnimates'] ?? true,

              ignorePointers: values['ignorePointers'] ?? false,

              buildCounter: switch (values['buildCounter']) {
                'hidden' => (
                    BuildContext context, {
                    required int currentLength,
                    required bool isFocused,
                    required int? maxLength,
                  }) =>
                      null,
                'original' => (
                    BuildContext context, {
                    required int currentLength,
                    required bool isFocused,
                    required int? maxLength,
                  }) =>
                      Text(
                        'あと${(maxLength ?? 0) - currentLength}文字入力可能',
                      ),
                _ => null,
              },

              // ------------------
              // InputDecoration
              // ------------------

              decoration: InputDecoration(
                hintText: safeText(values['hintText']),
                labelText: safeText(values['labelText']),
                helperText: safeText(values['helperText']),
                errorText: safeText(values['errorText']),
                prefixText: safeText(values['prefixText']),
                suffixText: safeText(values['suffixText']),
                counterText: safeText(values['counterText']),
                icon: buildIcon(values['icon']),
                prefixIcon: buildIcon(values['prefixIcon']),
                suffixIcon: buildIcon(values['suffixIcon']),
                //enabled: values['decorationEnabled'] ?? true,
                filled: values['filled'] ?? false,
                fillColor: safeColor(values['fillColor']),
                isDense: values['isDense'] ?? false,
                isCollapsed: values['isCollapsed'] ?? false,
                alignLabelWithHint: values['alignLabelWithHint'] ?? false,
                contentPadding: isDense
                    ? null
                    : EdgeInsets.symmetric(
                        horizontal: (values['contentPaddingHorizontal'] ?? 12.0)
                            .toDouble(),
                        vertical: (values['contentPaddingVertical'] ?? 12.0)
                            .toDouble(),
                      ),
                floatingLabelBehavior: switch (
                    values['floatingLabelBehavior']) {
                  'always' => FloatingLabelBehavior.always,
                  'never' => FloatingLabelBehavior.never,
                  _ => FloatingLabelBehavior.auto,
                },
                floatingLabelAlignment: switch (
                    values['floatingLabelAlignment']) {
                  'center' => FloatingLabelAlignment.center,
                  _ => FloatingLabelAlignment.start,
                },
                border: customBorder,
                enabledBorder: customBorder,
                focusedBorder: customBorder,
                disabledBorder: customBorder,
                errorBorder:
                values['useDefaultErrorBorder'] ?? true
                    ? null
                    : customBorder,

                focusedErrorBorder:
                values['useDefaultFocusedErrorBorder'] ?? true
                    ? null
                    : customBorder,
              ),
            ),
          ),
        ],
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
    final hintText = values['hintText'] ?? '';

    final enabled = values['enabled'] ?? true;

    final readOnly = values['readOnly'] ?? false;

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
