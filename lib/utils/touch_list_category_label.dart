import '../touch/touch_category.dart';

String labelForTouchListCategory(TouchListCategory category) {
  switch (category) {
    case TouchListCategory.field:
      return 'Field';

    case TouchListCategory.placeholderLabel:
      return 'Placeholder & Label';

    case TouchListCategory.inputRule:
      return 'Input Rules';

    case TouchListCategory.keyboard:
      return 'Keyboard';

    case TouchListCategory.text:
      return 'Text';

    case TouchListCategory.cursor:
      return 'Cursor';

    case TouchListCategory.icon:
      return 'Icon';
  }
}