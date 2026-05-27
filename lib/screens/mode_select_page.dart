import 'package:flutter/material.dart';
import 'home_page.dart';
import 'learn_page.dart';

class ModeSelectPage extends StatelessWidget {
  const ModeSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFFDFCF8),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              /// 上部イラスト
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/mode_header.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 24),

              /// ボタンエリア
              Expanded(
                flex: 1,

                child: Column(
                  children: [

                    ModeButton(
                      label: 'Touch',
                      icon: Icons.touch_app,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomePage(),
                          ),
                        );
                      },
                    ),

                    ModeButton(
                      label: 'Learn',
                      icon: Icons.menu_book,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LearnPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const ModeButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,

        margin: const EdgeInsets.symmetric(vertical: 12),

        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 24,
        ),

        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),

            const SizedBox(width: 12),

            Text(
              label,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}