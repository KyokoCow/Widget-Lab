import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/data/color_palettes.dart';
import '../data/samples.dart';
import '../models/sample.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Sample selected = samples.first;
  Map<String, dynamic> config = {};
  int selectedPaletteIndex = 0;
  bool showSettings = false;

  @override
  void initState() {
    super.initState();
    config = {}; // ← 初期化明示
  }

  void _selectSample(Sample s) {
    setState(() {
      selected = s;
      config = {}; // ← 必ずリセット（重要）
      showSettings = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;
    final palette = palettes[selectedPaletteIndex];


    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Sampler")),
      body: isLandscape
          ? _buildLandscape(palette) // ←ここ修正
          : _buildPortrait(palette), // ←ここも
    );
  }

  /* =========================
     設定パネル
  ========================= */
  Widget _buildSettingsPanel(AppColorPalette palette) {
    if (!showSettings) {
      return ListView(
        children: samples.map((s) {
          return ListTile(
            title: Text(s.title),
            selected: selected.id == s.id,
            onTap: () => _selectSample(s),
          );
        }).toList(),
      );
    }

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.arrow_back),
          title: const Text("Widget一覧へ戻る"),
          onTap: () {
            setState(() {
              showSettings = false;
            });
          },
        ),
        const Divider(),

        Expanded(
          child: selected.settingsBuilder(
                (newConfig) {
              setState(() {
                config = Map<String, dynamic>.from(newConfig);
              });
            },
            config,
            palette,
          ),
        ),
      ],
    );
  }

  /* =========================
     横画面
  ========================= */
  Widget _buildLandscape(AppColorPalette palette) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: width * 0.4, // ←40%
          color: Colors.grey[200],
          child: _buildSettingsPanel(palette),
        ),

        Expanded(
          child: Column(
            children: [
              Expanded(child: _buildPreview()),
              Expanded(child: _buildCodePanel()),
            ],
          ),
        ),
      ],
    );
  }

  /* =========================
     縦画面
  ========================= */
  Widget _buildPortrait(palette) {
    return Column(
      children: [
        // ▼ プレビュー（小さく）
        Expanded(
          flex: 2,
          child: _buildPreview(),
        ),

        // ▼ コード（そのまま or 少し縮める）
        Expanded(
          flex: 3,
          child: _buildCodePanel(),
        ),

        // ▼ 設定（広く）
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.grey[200],
            child: _buildSettingsPanel(palette),
          ),
        ),
      ],
    );
  }

  /* =========================
     コード表示
  ========================= */
  Widget _buildCodePanel() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SelectableText(
            selected.codeBuilder(config),
            style: const TextStyle(
              fontFamily: 'monospace',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
  /* =========================
     プレビュー表示
  ========================= */
  Widget _buildPreview() {
    return Container(
      color: Colors.white,
      child: Center(
        child: selected.previewBuilder(config),
      ),
    );
  }

}

