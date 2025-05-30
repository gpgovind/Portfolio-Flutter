import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:portfolio/app/utils/app_links.dart';

class CustomBtn extends StatefulWidget {
  const CustomBtn({super.key});

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Color normalBackground = colorScheme.surface;
    final Color hoverBackground = colorScheme.primary;
    final Color normalTextColor = colorScheme.onSurface;
    final Color hoverTextColor = colorScheme.onPrimary;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isHovered ? hoverBackground : normalBackground,
            border: Border.all(
              color: colorScheme.primary.withOpacity(0.8),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: _downloadResume,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                'Download Resume',
                style: TextStyle(
                  color: isHovered ? hoverTextColor : normalTextColor,
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

  void _downloadResume() {
    final html.AnchorElement anchor = html.AnchorElement(href: AppLinks.resume)
      ..download = 'govind_resume.pdf';
    anchor.click();
  }
}
