import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/modules/skills/controller/skills_controller.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: _skills(),
      ),
      desktop: Padding(
        padding: const EdgeInsets.only(top: 40, left: 230, bottom: 40),
        child: _skills(),
      ),
      tablet: Padding(
        
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: _skills(),
      ),
    );
  }

   _skills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              Text(
          'Skills',
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
               const SizedBox(height: 24),
        Text(
          'Here some of my Skills on which I have been working for the past one year',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
        
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(SkillsController.skills.length, (index) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: SkillsController.skillColors[index].withOpacity(0.15),
                border:
                    Border.all(color: SkillsController.skillColors[index]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                SkillsController.skills[index],
                style: TextStyle(
                  color: SkillsController.skillColors[index],
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 300.ms, delay: (index * 100).ms)
                .scale(
                    begin: Offset(0, 0.9),
                    end: Offset(1, 1.0),
                    duration: 500.ms);
          }),
        ),
      ],
    );
  }
}
