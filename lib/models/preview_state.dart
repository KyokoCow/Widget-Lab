import 'package:flutter/material.dart';

class PreviewState {
  TextEditingController? textController;
  FocusNode? focusNode;

  bool get isFocused => focusNode?.hasFocus ?? false;
}