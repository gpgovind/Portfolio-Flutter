import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: _experience(),
      ),
      desktop: Padding(
        padding: const EdgeInsets.only(top: 40, left: 230, bottom: 40),
        child: _experience(),
      ),
      tablet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: _experience(),
      ),
    );
  }

  Container _experience() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slide(begin: const Offset(0, 0.3)),
          const SizedBox(height: 24),
          _buildExperienceCard(
            title: 'Brototype',
            duration: '8-Month Bootcamp',
            description:
                'Intensive training under the guidance of experienced developers.\nBuilt 2 complete Flutter projects from scratch.',
            color: Colors.cyanAccent,
            delay: 0,
          ),
          const SizedBox(height: 20),
          _buildExperienceCard(
            title: 'Grapes Innovations',
            duration: 'May 2024 – April 2025',
            description:
                'Worked as a Flutter developer contributing to 3–4 real-world projects.\nInvolved in UI development, state management, and REST API integration.',
            color: Colors.deepPurpleAccent,
            delay: 300,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard({
    required String title,
    required String duration,
    required String description,
    required Color color,
    required int delay,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                color: color,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 6),
          Text(duration,
              style: TextStyle(
                color: color.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: delay.ms)
        .slide(begin: const Offset(0.1, 0));
  }
}
