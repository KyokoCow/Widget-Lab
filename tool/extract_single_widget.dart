import 'dart:convert';
import 'dart:io';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';

void main(List<String> args) {
  final widgetName = args.isNotEmpty ? args[0] : 'Container';

  final flutterRoot = Platform.environment['FLUTTER_ROOT'];
  if (flutterRoot == null) {
    print('FLUTTER_ROOT not found');
    return;
  }

  final files = [
    '$flutterRoot/packages/flutter/lib/src/widgets/container.dart',
    '$flutterRoot/packages/flutter/lib/src/material/scaffold.dart',
    '$flutterRoot/packages/flutter/lib/src/widgets/text.dart',
    '$flutterRoot/packages/flutter/lib/src/widgets/basic.dart',
  ];

  Map<String, String> fieldTypes = {};

  Map<String, dynamic>? resultData;

  for (final path in files) {
    final file = File(path);
    if (!file.existsSync()) continue;

    final source = file.readAsStringSync();

    final result = parseString(
      content: source,
      throwIfDiagnostics: false,
    );

    final unit = result.unit;

    // ★ フィールド型収集
    for (final decl in unit.declarations) {
      if (decl is ClassDeclaration) {
        for (final member in decl.members) {
          if (member is FieldDeclaration) {
            final type = member.fields.type?.toSource() ?? 'dynamic';

            for (final v in member.fields.variables) {
              fieldTypes[v.name.lexeme] = type;
            }
          }
        }
      }
    }

    for (final decl in unit.declarations) {
      if (decl is! ClassDeclaration) continue;
      if (decl.name.lexeme != widgetName) continue;

      print('FOUND CLASS: ${decl.name.lexeme}');

      final constructors = decl.members
          .whereType<ConstructorDeclaration>()
          .toList();

      if (constructors.isEmpty) {
        print('No constructors found');
        continue;
      }

      final constructor = constructors.firstWhere(
            (c) => c.name == null,
        orElse: () => constructors.first,
      );

      final params = <Map<String, dynamic>>[];

      for (final p in constructor.parameters.parameters) {
        final param = p is DefaultFormalParameter ? p.parameter : p;

        String name = '';
        String type = 'dynamic';

        if (param is SimpleFormalParameter) {
          name = param.name?.lexeme ?? '';
          type = param.type?.toSource() ??
              fieldTypes[name] ??
              'dynamic';
        } else if (param is FieldFormalParameter) {
          name = param.name.lexeme;
          type = param.type?.toSource() ??
              fieldTypes[name] ??
              'dynamic';
        } else if (param is SuperFormalParameter) {
          name = param.name.lexeme;
          type = param.type?.toSource() ??
              fieldTypes[name] ??
              'dynamic';
        } else if (param is FunctionTypedFormalParameter) {
          name = param.name.lexeme;
          type = param.returnType?.toSource() ??
              fieldTypes[name] ??
              'Function';
        }

        if (name.isEmpty) continue;

        type = type.isEmpty ? 'dynamic' : type;

        // ★ defaultValue抽出
        String defaultValue = '';
        if (p is DefaultFormalParameter && p.defaultValue != null) {
          defaultValue = p.defaultValue!.toSource().trim();
        }

        // ★ typeKind判定
        final typeKind = getTypeKind(type);

        params.add({
          'name': name,
          'type': type,
          'typeKind': typeKind,
          'required': p is DefaultFormalParameter
              ? p.requiredKeyword != null
              : false,
          'nullable': type.contains('?'),
          'description': '',
          'sdkDescription': '',
          'defaultValue': defaultValue,
        });
      }

      resultData = {
        'widget': widgetName,
        'classDescription': '',
        'params': params,
      };

      break;
    }
  }

  if (resultData == null) {
    print('Widget not found');
    return;
  }

  final outputDir = Directory('generated');
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  final file = File('generated/${widgetName.toLowerCase()}.json');

  file.writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(resultData),
  );

  print('Saved: ${file.path}');
}

String getTypeKind(String type) {
  final clean = type.replaceAll('?', '');

  const primitive = {
    'bool',
    'int',
    'double',
    'String',
    'num',
    'dynamic',
  };

  const enums = {
    'MainAxisAlignment',
    'CrossAxisAlignment',
    'Alignment',
    'AlignmentGeometry',
    'TextAlign',
    'TextOverflow',
    'Clip',
    'FontStyle',
    'FontWeight',
  };

  if (primitive.contains(clean)) return 'primitive';
  if (enums.contains(clean)) return 'enum';

  return 'class';
}