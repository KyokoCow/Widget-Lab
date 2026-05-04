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
     横画面
  ========================= */
  Widget _buildLandscape() {
    return Row(
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
                  setState(() => selected = s);
                },
              );
            }).toList(),
          ),
        ),

        // 右：プレビュー + コード
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(child: selected.builder()),
                ),
              ),
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
     縦画面（3分割）
  ========================= */
  Widget _buildPortrait() {
    return Column(
      children: [
        // 上：プレビュー
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.white,
            child: Center(child: selected.builder()),
          ),
        ),

        // 中：コード
        Expanded(
          flex: 3,
          child: _buildCodePanel(),
        ),

        // 下：設定（リスト）
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey[200],
            child: ListView(
              children: samples.map((s) {
                return ListTile(
                  title: Text(s.title),
                  selected: selected.id == s.id,
                  onTap: () {
                    setState(() => selected = s);
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  /* =========================
     共通：コード表示
  ========================= */
  Widget _buildCodePanel() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SelectableText(
            selected.code,
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