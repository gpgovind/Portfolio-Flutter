import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/app/utils/app_links.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _chipController;
  late Animation<Offset> _imageOffsetAnimation;
  late Animation<double> _chipAnimation;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _chipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _imageOffsetAnimation = Tween<Offset>(
      begin: const Offset(-0.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _imageController,
        curve: Curves.easeOut,
      ),
    );

    _chipAnimation = CurvedAnimation(
      parent: _chipController,
      curve: Curves.easeInOut,
    );

    _imageController.forward();
    _chipController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _chipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Responsive(
      mobile: Padding(
        padding: const EdgeInsets.all(20),
        child: _bodyMobile(colorScheme),
      ),
      desktop: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 100),
        child: _bodyDesktop(colorScheme),
      ),
      tablet: Padding(
        padding: const EdgeInsets.all(40),
        child: _bodyDesktop(colorScheme),
      ),
    );
  }

  Widget _bodyDesktop(ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: SlideTransition(
            position: _imageOffsetAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Lottie.asset(
                AppLinks.flutterDev,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: _aboutContent(colorScheme),
        ),
      ],
    );
  }

  Widget _bodyMobile(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: 1,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeIn,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Lottie.asset(
              AppLinks.flutterDev,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        _aboutContent(colorScheme),
      ],
    );
  }

  Widget _aboutContent(ColorScheme colorScheme) {
    return Card(
      color: colorScheme.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
          Text(
  "Flutter developer with 1 year of experience seeking new opportunities. Skilled in iOS/Android deployment, state management (Riverpod, BLoC, GetX, Provider), Firebase, and RESTful APIs. Passionate about creating intuitive, scalable mobile solutions with clean code that delivers business value. Available immediately and eager to contribute to your team's success.",
  style: TextStyle(
    fontSize: 16,
    color: colorScheme.onSurface.withOpacity(0.8),
    height: 1.6,
  ),
),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(_skills.length, (index) {
                final skill = _skills[index];
                return AnimatedBuilder(
                  animation: _chipAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1 + (_chipAnimation.value * 0.05),
                      child: Opacity(
                        opacity: _chipAnimation.value,
                        child: child,
                      ),
                    );
                  },
                  child: _skillChip(
                    skill['icon'] as IconData,
                    skill['label'] as String,
                    colorScheme,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _skillChip(IconData icon, String label, ColorScheme colorScheme) {
    return Chip(
      avatar: Icon(
        icon,
        color: colorScheme.onPrimary,
        size: 20,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: colorScheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

final List<Map<String, dynamic>> _skills = [
  {'icon': Icons.web, 'label': 'Web Development'},
  {'icon': Icons.design_services, 'label': 'UI/UX Design'},
  {'icon': Icons.phone_iphone, 'label': 'Mobile Development'},
 // {'icon': Icons.storage, 'label': 'Backend Development'},
];
