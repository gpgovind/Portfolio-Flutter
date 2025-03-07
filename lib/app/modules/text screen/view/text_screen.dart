import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:portfolio/app/core/app_color.dart';
import 'package:portfolio/app/modules/text%20screen/widgets/custom_btn.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Responsive(
      tablet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: _textBody(colorScheme),
      ),
      desktop: Padding(
        padding: const EdgeInsets.only(top: 40, left: 230, bottom: 40),
        child: _textBody(colorScheme),
      ),
      mobile: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: _textBody(colorScheme),
      ),
    );
  }

  Widget _textBody(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter Developer & \nMobile App Enthusiast',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                  color: colorScheme.onBackground, // Dynamic title color
                ),
              ),
              const SizedBox(height: 25),
              Text(
                '''Building seamless, high-performance mobile experiences with beautiful, \nresponsive design and powerful functionality.''',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: colorScheme.onSurface
                      .withOpacity(0.8), // Subtle subtext color
                ),
              ),
              const SizedBox(height: 25),
              const CustomBtn(),
            ],
          ),
        ),
        Image.asset('assets/gif/capture.gif'),
        Spacer()
      ],
    );
  }
}
