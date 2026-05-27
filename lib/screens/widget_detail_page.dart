import 'package:flutter/material.dart';

class WidgetDetailPage extends StatelessWidget {
  final String name;
  final Map<String, dynamic> data;

  const WidgetDetailPage({
    super.key,
    required this.name,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final params = (data['params'] as List?) ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // カテゴリ
              Text(
                data['category'] ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 8),

              // 説明
              Text(
                data['description'] ?? '',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              const Text(
                'Parameters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // params一覧
              ...params.map((p) {
                final typeKind =
                (p['typeKind'] ?? 'primitive').toString();

                final isRequired = p['required'] == true;
                final isNullable = p['nullable'] == true;

                final sdkDescription =
                (p['sdkDescription'] ?? '').toString();

                return Stack(
                  children: [
                    Card(
                      color: _getTypeKindColor(typeKind),
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 名前
                            Text(
                              p['name'] ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 6),

                            // type
                            Text(
                              'type: ${p['type'] ?? ''}',
                              style: const TextStyle(fontSize: 13),
                            ),

                            // defaultValue
                            if ((p['defaultValue'] ?? '')
                                .toString()
                                .isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                'default: ${p['defaultValue']}',
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],

                            // description
                            if ((p['description'] ?? '')
                                .toString()
                                .isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Text(
                                p['description'],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],

                            // sdkDescription（★折りたたみ対応）
                            if (sdkDescription.isNotEmpty) ...[
                              const SizedBox(height: 6),
                              _SdkDescriptionBlock(text: sdkDescription),
                            ],
                          ],
                        ),
                      ),
                    ),

                    // 右上アイコン
                    Positioned(
                      top: 12,
                      right: 10,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isRequired)
                            const Icon(
                              Icons.check_circle,
                              size: 18,
                              color: Colors.redAccent,
                            ),
                          if (isNullable)
                            const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.hide_source,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  // typeKindによるカード色
  Color _getTypeKindColor(String typeKind) {
    switch (typeKind) {
      case 'primitive':
        return const Color(0xFFFFE4EC);
      case 'class':
        return const Color(0xFFFFF6C7);
      case 'enum':
        return const Color(0xFFD6ECFF);
      default:
        return Colors.white;
    }
  }
}

/// ★SDK説明の折りたたみ表示
class _SdkDescriptionBlock extends StatefulWidget {
  final String text;

  const _SdkDescriptionBlock({required this.text});

  @override
  State<_SdkDescriptionBlock> createState() =>
      _SdkDescriptionBlockState();
}

class _SdkDescriptionBlockState extends State<_SdkDescriptionBlock> {
  bool expanded = false;

  bool get isLong => widget.text.length > 120;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;

    if (!isLong) {
      return Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            maxLines: expanded ? null : 3,
            overflow: expanded
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            expanded ? 'collapse' : 'more...',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}