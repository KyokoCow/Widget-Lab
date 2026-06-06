import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/pages/touch_page.dart';
import '../models/widget_definition.dart';
import '../models/widget_param.dart';

class WidgetDetailPage extends StatelessWidget {
  final WidgetDefinition definition;

  const WidgetDetailPage({
    super.key,
    required this.definition,
  });

  @override
  Widget build(BuildContext context) {
    final params = definition.params;
    debugPrint("DETAIL PAGE BUILD: ${definition.title}");

    return Scaffold(
      appBar: AppBar(
        title: Text(definition.title),

        actions: [
          if (definition.touchParams.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TouchPage(
                        definition: definition,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.touch_app),
                label: const Text('Touch'),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // =========================
            // Header Card（修正済み）
            // =========================
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                definition.title,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _categoryChip(definition.category),
                            ],
                          ),
                        ),

                        const SizedBox(width: 16),

                        SizedBox(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: _miniPreview(definition),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const SizedBox(height: 8),

                    if (definition.parentId != null)
                      Row(
                        children: [
                          const Icon(
                            Icons.account_tree,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            definition.parentId!,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 12),

                    Text(
                      definition.description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // =========================
            // Parameters Header
            // =========================
            const Text(
              'Parameters',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // =========================
            // Parameters List
            // =========================
            ...params.map((param) {
              return Card(
                color: _cardColor(param.typeKind),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              param.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          _typeKindChip(param.typeKind),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Tooltip(
                            message: _parameterKindLabel(param.parameterKind),
                            child: Icon(
                              _parameterKindIcon(param.parameterKind),
                              size: 18,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            param.type,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Text(param.description),

                      if (param.sdkDescription.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        SdkDescriptionBlock(
                          text: param.sdkDescription,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _categoryChip(String category) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            category,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
  Widget _miniPreview(WidgetDefinition def) {
    final widget = def.miniPreviewBuilder?.call();

    if (widget == null) {
      return const Icon(
        Icons.block,
        size: 32,
        color: Colors.grey,
      );
    }

    return SizedBox(
      width: 80,
      height: 80,
      child: Center(child: widget),
    );
  }



  IconData _parameterKindIcon(ParameterKind kind) {
    switch (kind) {
      case ParameterKind.positional:
        return Icons.arrow_forward;
      case ParameterKind.named:
        return Icons.sell;
      case ParameterKind.requiredNamed:
        return Icons.star;
    }
  }

  String _parameterKindLabel(ParameterKind kind) {
    switch (kind) {
      case ParameterKind.positional:
        return 'Positional';
      case ParameterKind.named:
        return 'Named';
      case ParameterKind.requiredNamed:
        return 'Required Named';
    }
  }

  Color _cardColor(TypeKind kind) {
    switch (kind) {
      case TypeKind.primitive:
        return Colors.blue.shade50;
      case TypeKind.enumType:
        return Colors.green.shade50;
      case TypeKind.classType:
        return Colors.orange.shade50;
    }
  }

  Widget _typeKindChip(TypeKind kind) {
    final color = switch (kind) {
      TypeKind.primitive => Colors.blue,
      TypeKind.enumType => Colors.green,
      TypeKind.classType => Colors.orange,
    };

    final label = switch (kind) {
      TypeKind.primitive => 'Primitive',
      TypeKind.enumType => 'Enum',
      TypeKind.classType => 'Class',
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SdkDescriptionBlock extends StatefulWidget {
  final String text;

  const SdkDescriptionBlock({
    super.key,
    required this.text,
  });

  @override
  State<SdkDescriptionBlock> createState() =>
      _SdkDescriptionBlockState();
}

class _SdkDescriptionBlockState
    extends State<SdkDescriptionBlock> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;

    // ガード（nullは不要、Stringはnon-null）
    if (text.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        LayoutBuilder(
          builder: (context, constraints) {
            final span = TextSpan(
              text: text,
              style: DefaultTextStyle.of(context).style,
            );

            final tp = TextPainter(
              text: span,
              maxLines: 3,
              textDirection: TextDirection.ltr,
            )..layout(maxWidth: constraints.maxWidth);

            final isOverflow = tp.didExceedMaxLines;

            final displayText = isExpanded
                ? text
                : (isOverflow
                ? _limitText(text, 120)
                : text);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayText,
                ),

                if (isOverflow)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        isExpanded ? "Less" : "More",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  // 120文字カット用（安定版）
  String _limitText(String text, int limit) {
    if (text.length <= limit) return text;
    return text.substring(0, limit) + "...";
  }
}