import 'package:flutter/material.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: const Color(0xFF0A192F),
      child: Column(
        children: [
          Text(
            "© ${DateTime.now().year} Govind P. All rights reserved.",
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Made with ❤️ using Flutter",
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
