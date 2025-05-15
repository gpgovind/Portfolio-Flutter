import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/card%20screen/widgets/card_widget.dart';
import 'package:portfolio/app/utils/app_links.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class CardScreen extends StatelessWidget {
  CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Responsive(
      mobile: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Projects',
              style: TextStyle(
                 fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
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
              'Projects',
              style: TextStyle(
                 fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
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
              'Projects',
              style: TextStyle(
                 fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
              ),
            ),
            _body(),
          ],
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
        (index) => ProjectCard(
          image: projects[index]['image']!,
          projectName: projects[index]['name']!,
          description: projects[index]['description']!,
        ),
      ),
    );
  }

  Widget _bodyDesktop() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: List.generate(
        3,
        (index) => ProjectCard(
            image: projects[index]['image']!,
            projectName: projects[index]['name']!,
            description: projects[index]['description']!),
      ),
    );
  }

  final List<Map<String, String>> projects = [
    {
      'name': 'PixelsX',
      'description':
          'A camera selling e-commerce app integrated with Firebase for backend, Riverpod for state management, and Razorpay for payment processing.',
      'image': AppLinks.secondProject,
    },
    {
      'name': 'MediWater',
      'description':
          'A water intake recorder app using Provider for state management and Hive database for local storage to help users track and manage daily water intake.',
      'image': AppLinks.firstProject,
    },
    {
      'name': 'TaskMaster',
      'description':
          'A task management app that allows users to create, update, and track their tasks. It uses Riverpod for state management and SQLite for local storage to persist user data.',
      'image': AppLinks.secondProject,
    }
  ];
}
