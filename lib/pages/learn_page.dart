import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/pages/touch_page.dart';
import 'package:flutter_ui_catalog/pages/widget_detail_page.dart';
import '../models/widget_definition.dart';
import '../widget_definitions/widget_definitions.dart';


class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, List<WidgetDefinition>> data = {
    "Layout": [],
    "Input": [],
    "Display": [],
  };

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: data.keys.length, vsync: this);

    _loadDefinitions();
  }

  void _loadDefinitions() {
    final all = widgetDefinitions; // ← 静的定義リスト

    for (final def in all) {
      data[def.category] ??= [];
      data[def.category]!.add(def);
    }

    setState(() {});
  }

  IconData _getIcon(String category) {
    switch (category.toLowerCase()) {
      case 'layout':
        return Icons.view_quilt;
      case 'input':
        return Icons.keyboard;
      case 'display':
        return Icons.visibility;
      default:
        return Icons.extension;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Learn"),
            Text(
              "v1.0 | 42 widgets",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: data.keys.map((category) {
            return Tab(
              icon: Icon(_getIcon(category)),
              text: category,
            );
          }).toList(),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: data.keys.map((category) {
                final items = data[category]!;

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final def = items[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: ListTile(
                        title: Text(
                          def.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),

                            // description（軽く表示）
                            Text(
                              def.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: 6),

                            // param数表示
                            Row(
                              children: [
                                Icon(
                                  Icons.tune,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "${def.params.length} params",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        trailing: def.touchParams.isNotEmpty
                            ? FilledButton(
                          style: FilledButton.styleFrom(
                            elevation: 3,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TouchPage(
                                  definition: def,
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.touch_app,
                            size: 22,
                          ),
                        )
                            : null,

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  WidgetDetailPage(definition: def),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}