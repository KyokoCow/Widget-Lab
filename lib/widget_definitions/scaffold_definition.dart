import 'package:flutter/material.dart';

import '../models/widget_definition.dart';
import '../models/widget_param.dart';
import '../models/widget_touchparam.dart';
import '../ui/touch_ui_type.dart';

final scaffoldDefinition = WidgetDefinition(
  id: 'scaffold',
  title: 'Scaffold',
  category: 'Material',
  parentId: 'StatefulWidget',
  description: 'Material Designの基本的な画面構造を提供するWidget',
  miniPreviewBuilder: () => const Icon(Icons.dashboard),

  touchParams: [
    TouchParam(
      key: 'backgroundColor',
      label: 'Background Color',
      uiType: TouchUiType.colorPicker,
      initialValue: 0xFFFFFFFF,
    ),

    TouchParam(
      key: 'resizeToAvoidBottomInset',
      label: 'Resize To Avoid Bottom Inset',
      uiType: TouchUiType.checkbox,
      initialValue: true,
    ),

    TouchParam(
      key: 'extendBody',
      label: 'Extend Body',
      uiType: TouchUiType.checkbox,
      initialValue: false,
    ),

    TouchParam(
      key: 'extendBodyBehindAppBar',
      label: 'Extend Body Behind AppBar',
      uiType: TouchUiType.checkbox,
      initialValue: false,
    ),

    TouchParam(
      key: 'primary',
      label: 'Primary',
      uiType: TouchUiType.checkbox,
      initialValue: true,
    ),

    TouchParam(
      key: 'showAppBar',
      label: 'Show AppBar',
      uiType: TouchUiType.checkbox,
      initialValue: true,
    ),

    TouchParam(
      key: 'appBarHeight',
      label: 'AppBar Height',
      uiType: TouchUiType.slider,
      min: 40,
      max: 120,
      initialValue: 56,
    ),

    TouchParam(
      key: 'showDrawer',
      label: 'Show Drawer',
      uiType: TouchUiType.checkbox,
      initialValue: false,
    ),

    TouchParam(
      key: 'showEndDrawer',
      label: 'Show End Drawer',
      uiType: TouchUiType.checkbox,
      initialValue: false,
    ),

    TouchParam(
      key: 'drawerEnableOpenDragGesture',
      label: 'Drawer Drag Gesture',
      uiType: TouchUiType.checkbox,
      initialValue: true,
    ),

    TouchParam(
      key: 'showFloatingActionButton',
      label: 'Show FAB',
      uiType: TouchUiType.checkbox,
      initialValue: true,
    ),

    TouchParam(
      key: 'showBottomNavigationBar',
      label: 'Show Bottom Navigation Bar',
      uiType: TouchUiType.checkbox,
      initialValue: false,
    ),

    TouchParam(
      key: 'bottomNavigationItemCount',
      label: 'Bottom Navigation Items',
      uiType: TouchUiType.segmented,
      items: ['3', '4', '5', '6'],
      initialValue: '3',
    ),

    TouchParam(
      key: 'showBottomSheet',
      label: 'Show Bottom Sheet',
      uiType: TouchUiType.checkbox,
      initialValue: false,
    ),

    TouchParam(
      key: 'showPersistentFooterButtons',
      label: 'Show Footer Buttons',
      uiType: TouchUiType.checkbox,
      initialValue: false,
    ),
  ],

  params: [
    WidgetParam(
      name: 'appBar',
      type: 'PreferredSizeWidget?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '画面上部に表示するAppBar',
    ),

    WidgetParam(
      name: 'body',
      type: 'Widget?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '画面のメインコンテンツ',
    ),

    WidgetParam(
      name: 'floatingActionButton',
      type: 'Widget?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '画面上に浮かぶアクションボタン',
    ),

    WidgetParam(
      name: 'floatingActionButtonLocation',
      type: 'FloatingActionButtonLocation?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'FloatingActionButtonの表示位置',
    ),

    WidgetParam(
      name: 'floatingActionButtonAnimator',
      type: 'FloatingActionButtonAnimator?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'FloatingActionButtonの移動アニメーション',
    ),

    WidgetParam(
      name: 'persistentFooterButtons',
      type: 'List<Widget>?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '画面下部に固定表示するボタン群',
    ),

    WidgetParam(
      name: 'persistentFooterAlignment',
      type: 'AlignmentGeometry',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: 'persistentFooterButtonsの配置',
    ),

    WidgetParam(
      name: 'drawer',
      type: 'Widget?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '左側から表示されるDrawer',
    ),

    WidgetParam(
      name: 'onDrawerChanged',
      type: 'DrawerCallback?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'Drawerの開閉時に呼ばれるコールバック',
    ),

    WidgetParam(
      name: 'endDrawer',
      type: 'Widget?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '右側から表示されるDrawer',
    ),

    WidgetParam(
      name: 'onEndDrawerChanged',
      type: 'DrawerCallback?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'EndDrawerの開閉時に呼ばれるコールバック',
    ),

    WidgetParam(
      name: 'bottomNavigationBar',
      type: 'Widget?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '画面下部のナビゲーションバー',
    ),

    WidgetParam(
      name: 'bottomSheet',
      type: 'Widget?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '画面下部に固定表示するシート',
    ),

    WidgetParam(
      name: 'backgroundColor',
      type: 'Color?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'Scaffold全体の背景色',
    ),

    WidgetParam(
      name: 'resizeToAvoidBottomInset',
      type: 'bool?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'キーボード表示時にbodyをリサイズするか',
    ),

    WidgetParam(
      name: 'primary',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: '画面上部のシステム領域を考慮するか',
    ),

    WidgetParam(
      name: 'extendBody',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: 'bodyをbottomNavigationBarの背後まで広げるか',
    ),

    WidgetParam(
      name: 'extendBodyBehindAppBar',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: 'bodyをAppBarの背後まで広げるか',
    ),

    WidgetParam(
      name: 'drawerScrimColor',
      type: 'Color?',
      typeKind: TypeKind.classType,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'Drawer表示時の背景オーバーレイ色',
    ),

    WidgetParam(
      name: 'drawerEdgeDragWidth',
      type: 'double?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: 'Drawerを開けるドラッグ開始領域の幅',
    ),

    WidgetParam(
      name: 'drawerEnableOpenDragGesture',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: 'スワイプでDrawerを開けるか',
    ),

    WidgetParam(
      name: 'endDrawerEnableOpenDragGesture',
      type: 'bool',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: false,
      description: 'スワイプでEndDrawerを開けるか',
    ),

    WidgetParam(
      name: 'restorationId',
      type: 'String?',
      typeKind: TypeKind.primitive,
      parameterKind: ParameterKind.named,
      nullable: true,
      description: '状態復元用のID',
    ),
  ],
);