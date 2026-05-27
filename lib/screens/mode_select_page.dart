import 'package:flutter/material.dart';
import 'home_page.dart';
import 'learn_page.dart';

class ModeSelectPage extends StatelessWidget {
  const ModeSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Widget Lab')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ),
                );
              },
              child: const Text('Touch Mode'),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LearnPage(),
                  ),
                );
              },
              child: const Text('Learn Mode'),
            ),
          ],
        ),
      ),
    );
  }
}