import '../ui/touch_ui_type.dart';
import '../models/widget_param.dart';

class ParamUiResolver {
  static TouchUiType resolve(WidgetParam param) {
    switch (param.typeKind) {
      case TypeKind.primitive:
        return _resolvePrimitive(param.type);

      case TypeKind.classType:
        return _resolveClass(param.type);

      case TypeKind.enumType:
        return TouchUiType.enumDropdown;
    }
  }

  static TouchUiType _resolvePrimitive(String type) {
    switch (type) {
      case 'bool':
        return TouchUiType.checkbox;

      case 'double':
      case 'int':
        return TouchUiType.slider;

      case 'String':
        return TouchUiType.text;

      default:
        return TouchUiType.text;
    }
  }

  static TouchUiType _resolveClass(String type) {
    switch (type) {
      case 'EdgeInsetsGeometry':
      case 'EdgeInsetsGeometry?':
        return TouchUiType.edgeInsets;

      default:
        return TouchUiType.text;
    }
  }
}