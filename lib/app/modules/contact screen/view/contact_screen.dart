import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/contact%20screen/widgets/custom_textfield.dart';
import 'package:portfolio/app/modules/contact%20screen/widgets/send_btn.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Responsive(
      mobile: _body(width, colorScheme),
      desktop: _body(width, colorScheme),
      tablet: _body(width, colorScheme),
    );
  }

  Widget _body(double width, ColorScheme colorScheme) {
    return Container(
      color: colorScheme.surface, // Background adapts to theme
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: width < 600 ? 20 : width / 3, // Handle small screens
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Let's Work Together",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Have a project in mind? Let's discuss how I can help your business grow.",
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: TextEditingController(),
            hintText: 'Your Name',
          ),
          const SizedBox(height: 10),
          CustomTextField(
            controller: TextEditingController(),
            hintText: 'Your Email',
          ),
          const SizedBox(height: 10),
          CustomTextField(
            isMaxLin: true,
            controller: TextEditingController(),
            hintText: 'Your Message',
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            onPressed: () {},
            text: 'Send Message',
          ),
        ],
      ),
    );
  }
}
