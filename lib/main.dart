import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_catalog/pages/learn_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        textTheme: GoogleFonts.notoSansJpTextTheme(),
      ),

      home: const LearnPage(),
    );
  }
}