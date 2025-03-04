import 'package:flutter/material.dart';

class CustomBtn extends StatefulWidget {
  const CustomBtn({super.key});

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isHovered ? Colors.black : Colors.grey.shade300,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              // TODO: Add navigation or action here
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                'View My Work',
                style: TextStyle(
                  color: isHovered ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
