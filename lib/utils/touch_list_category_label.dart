import '../touch/touch_category.dart';

String labelForTouchListCategory(TouchListCategory category) {
  switch (category) {
    case TouchListCategory.basic:
      return 'Basic';
    case TouchListCategory.text:
      return 'Text';
    case TouchListCategory.decoration:
      return 'Decoration';
    case TouchListCategory.cursor:
      return 'Cursor';
    case TouchListCategory.input:
      return 'Input';
    case TouchListCategory.behavior:
      return 'Behavior';
  }
}