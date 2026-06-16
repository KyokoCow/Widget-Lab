enum TypeKind {
  primitive,
  enumType,
  classType,
  functionType,
}

enum ParameterKind {
  positional,
  named,
  requiredNamed,
}



class WidgetParam {
  final String name;

  /// Dart型（UI・code両方の唯一の基準）
  final String type;

  final TypeKind typeKind;
  final ParameterKind parameterKind;

  final bool nullable;

  /// 初期値（型はtypeから解釈する）
  final dynamic defaultValue;

  final String description;
  final String sdkDescription;

  const WidgetParam({
    required this.name,
    required this.type,
    required this.typeKind,
    required this.parameterKind,
    required this.nullable,
    this.defaultValue,
    required this.description,
    this.sdkDescription = '',
  });
}

class ParamValueParser {
  static dynamic parse(String type, dynamic value, bool nullable) {
    if (value == null) {
      switch (type) {
        case 'bool':
          return false;
        case 'double':
          return 0.0;
        case 'int':
          return 0;
        default:
          return null;
      }
    }

    switch (type) {
      case 'bool':
        return value is bool ? value : value == 'true';

      case 'double':
        return value is num
            ? value.toDouble()
            : double.tryParse(value.toString()) ?? 0.0;

      case 'int':
        return value is num
            ? value.toInt()
            : int.tryParse(value.toString()) ?? 0;

      case 'String':
        return value.toString();

      default:
        return value;
    }
  }
}