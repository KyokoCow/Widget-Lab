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

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'layout':
        return const Color(0xFFFFE4EC);
      case 'input':
        return const Color(0xFFFFF6C7);
      case 'navigation':
        return const Color(0xFFD6ECFF);
      case 'style':
        return const Color(0xFFE6FFE6);
      case 'async':
        return const Color(0xFFFFE9D6);
      default:
        return Colors.white;
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
          final widgetData = data![key];

          final category = (widgetData['category'] ?? '').toString();

          return Card(
            color: _getCategoryColor(category),
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: Icon(
                _getCategoryIcon(category),
                color: Colors.black54,
              ),
              title: Text(
                key,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(category),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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