import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_catalog/screens/widget_detail_page.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    final jsonStr = await rootBundle.loadString(
      'assets/widget_data/widgets.json',
    );

    final decoded = jsonDecode(jsonStr) as Map<String, dynamic>;

    setState(() {
      data = decoded;
    });
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'layout':
        return Icons.view_quilt;

      case 'material':
        return Icons.widgets;

      case 'text':
        return Icons.text_fields;

      case 'button':
        return Icons.radio_button_checked;

      case 'input':
        return Icons.keyboard;

      case 'feedback':
        return Icons.feedback;

      case 'display':
        return Icons.visibility;

      case 'interaction':
        return Icons.touch_app;

      default:
        return Icons.extension;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final keys = data!.keys.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Learn')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: keys.length,
        itemBuilder: (context, index) {
          final key = keys[index];

          // _meta を一覧から除外
          if (key == '_meta') {
            return const SizedBox.shrink();
          }

          final widgetData = data![key];

          final category =
          (widgetData['category'] ?? '').toString();

          // Touch対応
          final touch =
              widgetData['touch'] ?? false;

          // Param数
          final paramCount =
              (widgetData['params'] as List?)?.length ?? 0;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),

            child: ListTile(
              leading: Icon(
                _getCategoryIcon(category),
                color: Colors.black54,
              ),

              title: Text(
                key,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Param数バッジ
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),

                child: Row(
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius:
                        BorderRadius.circular(999),
                      ),

                      child: Text(
                        '$paramCount params',

                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (touch)
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.touch_app,
                        size: 20,
                        color: Colors.orange,
                      ),
                    ),

                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ],
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WidgetDetailPage(
                      name: key,
                      data: widgetData,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}