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

  bool showSettings = false; // ←設定パネルの状態管理

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
     設定パネル本体（一覧⇄設定UI切替）
  ========================= */
  Widget _buildSettingsPanel() {
    if (!showSettings) {
      // ■ 一覧モード
      return ListView(
        children: samples.map((s) {
          return ListTile(
            title: Text(s.title),
            selected: selected.id == s.id,
            onTap: () {
              setState(() {
                selected = s;
                config = {};
                showSettings = true; // ←設定画面へ遷移
              });
            },
          );
        }).toList(),
      );
    } else {
      // ■ 個別設定モード
      return Column(
        children: [
          // 戻る
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

          // 設定UI（Widgetごと）
          Expanded(
            child: selected.settingsBuilder(
                  (newConfig) {
                setState(() {
                  config = newConfig;
                });
              },
              config,
            ),
          ),
        ],
      );
    }
  }

  /* =========================
     横画面
  ========================= */
  Widget _buildLandscape() {
    return Row(
      children: [
        // 左：設定パネル
        Container(
          width: 260,
          color: Colors.grey[200],
          child: _buildSettingsPanel(),
        ),

        // 右：プレビュー + コード
        Expanded(
          child: Column(
            children: [
              // 右上：プレビュー
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: selected.previewBuilder(config),
                  ),
                ),
              ),

              // 右下：コード
              Expanded(
                child: _buildCodePanel(),
              ),
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
        // 上：プレビュー
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.white,
            child: Center(
              child: selected.previewBuilder(config),
            ),
          ),
        ),

        // 中：コード
        Expanded(
          flex: 3,
          child: _buildCodePanel(),
        ),

        // 下：設定パネル（一覧⇄設定）
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