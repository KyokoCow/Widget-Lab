import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/data/color_palettes.dart';
import 'package:flutter_ui_catalog/screens/settings_page.dart';
import '../data/samples.dart';
import '../models/sample.dart';
import 'package:flutter_ui_catalog/theme/app_theme.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(
        title: const Text("Flutter Sampler"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: isLandscape
          ? _buildLandscape(palette)
          : _buildPortrait(palette),
    );
  }

  /* =========================
     設定パネル
  ========================= */
  Widget _buildSettingsPanel(AppColorPalette palette) {
    if (!showSettings) {
      return Container(
        color: AppTheme.sidebarColor,
        child: ListView.separated(
          itemCount: samples.length,
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              thickness: 1,
              color: Colors.black12,
            );
          },
          itemBuilder: (context, index) {
            final s = samples[index];

            return ListTile(
              title: Text(s.title),
              selected: selected.id == s.id,
              selectedTileColor: Colors.white.withOpacity(0.3),

              onTap: () => _selectSample(s),
            );
          },
        ),
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
          color: AppTheme.sidebarColor,
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
            color: AppTheme.sidebarColor,
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
      child: Stack(
        children: [

          // ■ コード表示
          Padding(
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
          ),

          // ■ コピーアイコン（右上）
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.copy, color: Colors.white),
              tooltip: 'コピー',
              onPressed: () {
                final code = selected.codeBuilder(config);

                Clipboard.setData(ClipboardData(text: code));

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copied!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
        ],
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
        child: selected.previewBuilder(
          config,
              (newConfig) {
            setState(() {
              config = newConfig;
            });
          },
        ),
      ),
    );
  }

}

