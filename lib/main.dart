import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

/* =========================
   データモデル
========================= */

class Sample {
  final String id;
  final String title;
  final String code;
  final Widget Function() builder;

  const Sample({
    required this.id,
    required this.title,
    required this.code,
    required this.builder,
  });
}

/* =========================
   サンプル一覧（10個）
========================= */

final List<Sample> samples = [
  Sample(
    id: "text",
    title: "Text",
    code: 'Text("Hello Flutter")',
    builder: () => const Center(child: Text("Hello Flutter")),
  ),

  Sample(
    id: "container",
    title: "Container",
    code: '''
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
)
''',
    builder: () => Center(
      child: Container(width: 100, height: 100, color: Colors.blue),
    ),
  ),

  Sample(
    id: "row",
    title: "Row",
    code: '''
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [Icon(Icons.star), Icon(Icons.star)],
)
''',
    builder: () => const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.star), Icon(Icons.star)],
    ),
  ),

  Sample(
    id: "column",
    title: "Column",
    code: '''
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [Text("A"), Text("B")],
)
''',
    builder: () => const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("A"), Text("B")],
    ),
  ),

  Sample(
    id: "button",
    title: "ElevatedButton",
    code: '''
ElevatedButton(
  onPressed: () {},
  child: Text("押す"),
)
''',
    builder: () => Center(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("押す"),
      ),
    ),
  ),

  Sample(
    id: "textfield",
    title: "TextField",
    code: 'TextField()',
    builder: () => const Padding(
      padding: EdgeInsets.all(16),
      child: TextField(),
    ),
  ),

  Sample(
    id: "list",
    title: "ListView",
    code: '''
ListView.builder(
  itemCount: 10,
  itemBuilder: (_, i) => ListTile(title: Text("Item \$i")),
)
''',
    builder: () => ListView.builder(
      itemCount: 10,
      itemBuilder: (_, i) => ListTile(title: Text("Item $i")),
    ),
  ),

  Sample(
    id: "card",
    title: "Card",
    code: '''
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text("Card"),
  ),
)
''',
    builder: () => const Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text("Card"),
        ),
      ),
    ),
  ),

  Sample(
    id: "dialog",
    title: "Dialog",
    code: '''
showDialog(
  context: context,
  builder: (_) => AlertDialog(title: Text("Hello")),
)
''',
    builder: () => Builder(
      builder: (context) => Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) =>
              const AlertDialog(title: Text("Hello Dialog")),
            );
          },
          child: const Text("ダイアログ表示"),
        ),
      ),
    ),
  ),

  Sample(
    id: "animated",
    title: "AnimatedContainer",
    code: '''
AnimatedContainer(
  duration: Duration(seconds: 1),
  width: 100→200,
)
''',
    builder: () => const AnimatedSample(),
  ),

  // ===== 追加20個 =====

  Sample(
    id: "icon",
    title: "Icon",
    code: 'Icon(Icons.favorite)',
    builder: () => const Center(child: Icon(Icons.favorite, size: 40)),
  ),

  Sample(
    id: "image",
    title: "Image.network",
    code: 'Image.network("https://picsum.photos/200")',
    builder: () => Image.network("https://picsum.photos/200"),
  ),

  Sample(
    id: "switch",
    title: "Switch",
    code: 'Switch(value: true, onChanged: (v){})',
    builder: () => const Center(child: Switch(value: true, onChanged: null)),
  ),

  Sample(
    id: "checkbox",
    title: "Checkbox",
    code: 'Checkbox(value: true, onChanged: (v){})',
    builder: () => const Center(child: Checkbox(value: true, onChanged: null)),
  ),

  Sample(
    id: "slider",
    title: "Slider",
    code: 'Slider(value: 0.5, onChanged: (v){})',
    builder: () => const Center(child: Slider(value: 0.5, onChanged: null)),
  ),

  Sample(
    id: "progress",
    title: "CircularProgressIndicator",
    code: 'CircularProgressIndicator()',
    builder: () => const Center(child: CircularProgressIndicator()),
  ),

  Sample(
    id: "linear_progress",
    title: "LinearProgressIndicator",
    code: 'LinearProgressIndicator()',
    builder: () => const LinearProgressIndicator(),
  ),

  Sample(
    id: "divider",
    title: "Divider",
    code: 'Divider()',
    builder: () => const Divider(),
  ),

  Sample(
    id: "spacer",
    title: "Spacer",
    code: 'Row(children:[Text("A"), Spacer(), Text("B")])',
    builder: () => const Row(
      children: [Text("A"), Spacer(), Text("B")],
    ),
  ),

  Sample(
    id: "padding",
    title: "Padding",
    code: 'Padding(padding: EdgeInsets.all(16), child: Text("Hi"))',
    builder: () => const Padding(
      padding: EdgeInsets.all(16),
      child: Text("Hi"),
    ),
  ),

  Sample(
    id: "align",
    title: "Align",
    code: 'Align(alignment: Alignment.bottomRight)',
    builder: () => const Align(
      alignment: Alignment.bottomRight,
      child: Text("右下"),
    ),
  ),

  Sample(
    id: "center",
    title: "Center",
    code: 'Center(child: Text("Center"))',
    builder: () => const Center(child: Text("Center")),
  ),

  Sample(
    id: "stack",
    title: "Stack",
    code: 'Stack(children:[...])',
    builder: () => Stack(
      children: [
        Container(width: 100, height: 100, color: Colors.blue),
        const Positioned(top: 10, left: 10, child: Text("Top")),
      ],
    ),
  ),

  Sample(
    id: "chip",
    title: "Chip",
    code: 'Chip(label: Text("Chip"))',
    builder: () => const Center(child: Chip(label: Text("Chip"))),
  ),

  Sample(
    id: "tooltip",
    title: "Tooltip",
    code: 'Tooltip(message:"説明", child: Icon(Icons.info))',
    builder: () => const Center(
      child: Tooltip(message: "説明", child: Icon(Icons.info)),
    ),
  ),

  Sample(
    id: "wrap",
    title: "Wrap",
    code: 'Wrap(children:[...])',
    builder: () => Wrap(
      spacing: 8,
      children: List.generate(5, (i) => Chip(label: Text("$i"))),
    ),
  ),

  Sample(
    id: "grid",
    title: "GridView",
    code: 'GridView.count(crossAxisCount:2)',
    builder: () => GridView.count(
      crossAxisCount: 2,
      children: List.generate(4, (i) => Card(child: Center(child: Text("$i")))),
    ),
  ),

  Sample(
    id: "listtile",
    title: "ListTile",
    code: 'ListTile(title: Text("Title"))',
    builder: () => const ListTile(
      title: Text("Title"),
      subtitle: Text("Subtitle"),
      leading: Icon(Icons.person),
    ),
  ),

  Sample(
    id: "appbar",
    title: "AppBar",
    code: 'AppBar(title: Text("Title"))',
    builder: () => const Center(child: Text("AppBarは上部に表示されます")),
  ),
];

/* =========================
   メイン画面
========================= */

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Sample selected = samples.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Sampler")),
      body: Row(
        children: [
          // 左：リスト
          Container(
            width: 220,
            color: Colors.grey[200],
            child: ListView(
              children: samples.map((s) {
                return ListTile(
                  title: Text(s.title),
                  selected: selected.id == s.id,
                  onTap: () {
                    setState(() {
                      selected = s;
                    });
                  },
                );
              }).toList(),
            ),
          ),

          // 右：プレビュー＋コード
          Expanded(
            child: Column(
              children: [
                // プレビュー
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(child: selected.builder()),
                  ),
                ),

                // コード
                Expanded(
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child:SelectableText(
                        selected.code,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================
   Animatedサンプル
========================= */

class AnimatedSample extends StatefulWidget {
  const AnimatedSample({super.key});

  @override
  State<AnimatedSample> createState() => _AnimatedSampleState();
}

class _AnimatedSampleState extends State<AnimatedSample> {
  bool big = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          big = !big;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: big ? 200 : 100,
        height: big ? 200 : 100,
        color: Colors.red,
      ),
    );
  }
}