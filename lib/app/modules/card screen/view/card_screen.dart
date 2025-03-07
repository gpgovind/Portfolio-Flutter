import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/card%20screen/widgets/card_widget.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: screenWidth,
      color: colorScheme.background, // Adapts to light/dark theme
      child: Responsive(
        mobile: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Project',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: colorScheme.onBackground,
                ),
              ),
              _body(),
            ],
          ),
        ),
        desktop: Padding(
          padding: const EdgeInsets.only(top: 40, left: 230, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Project',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: colorScheme.onBackground,
                ),
              ),
              _bodyDesktop()
            ],
          ),
        ),
        tablet: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Project',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: colorScheme.onBackground,
                ),
              ),
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: List.generate(
        3,
        (index) => const ProjectCard(),
      ),
    );
  }

  Widget _bodyDesktop() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: List.generate(
        3,
        (index) => const ProjectCard(),
      ),
    );
  }
}
