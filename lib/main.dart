import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/mode_select_page.dart';
import 'fonts/font_manager.dart';

void main() {
  runApp(
    ValueListenableBuilder(
      valueListenable: FontManager.notifier,
      builder: (_, __, ___) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const ModeSelectPage(),

      theme: ThemeData(
        fontFamily: "NotoSansJP",
      ),
    );
  }
}