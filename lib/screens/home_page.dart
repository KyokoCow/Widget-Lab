import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Sampler")),
      body: isLandscape ? _buildLandscape() : _buildPortrait(),
    );
  }

  /* =========================
     設定パネル
  ========================= */
  Widget _buildSettingsPanel() {
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
          ),
        ),
      ],
    );
  }

  /* =========================
     横画面
  ========================= */
  Widget _buildLandscape() {
    return Row(
      children: [
        Container(
          width: 260,
          color: Colors.grey[200],
          child: _buildSettingsPanel(),
        ),

        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: selected.previewBuilder(config),
                  ),
                ),
              ),
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
  Widget _buildPortrait() {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.white,
            child: Center(
              child: selected.previewBuilder(config),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: _buildCodePanel(),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey[200],
            child: _buildSettingsPanel(),
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
}