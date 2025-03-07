import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    double cardWidth = screenWidth < 600
        ? screenWidth * 0.9
        : screenWidth < 1200
            ? 350
            : 400;

    double cardHeight = isHovered
        ? (screenWidth < 600 ? 380 : 380)
        : (screenWidth < 600 ? 300 : 280);

    double titleFontSize = screenWidth < 600 ? 16 : 20;
    double descriptionFontSize = screenWidth < 600 ? 12 : 14;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: colorScheme.surface, // Dynamic background
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              if (isHovered)
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: colorScheme.primary, // Adaptive header
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Project Preview",
                  style: TextStyle(
                    color: colorScheme.onPrimary.withOpacity(0.8),
                    fontSize: descriptionFontSize,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "E-commerce Platform",
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      crossFadeState: isHovered
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: const SizedBox.shrink(),
                      secondChild: Text(
                        "Full-stack development of a modern e-commerce solution with responsive design, payment integration, and user dashboards.",
                        style: TextStyle(
                          color: colorScheme.onSurface.withOpacity(0.8),
                          fontSize: descriptionFontSize,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: colorScheme.primary,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "View Case Study",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: descriptionFontSize,
                                  color: colorScheme.primary,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Icon(Icons.arrow_right_alt,
                                  color: colorScheme.primary),
                            ],
                          ),
                        ),
                      ],
                    )
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
