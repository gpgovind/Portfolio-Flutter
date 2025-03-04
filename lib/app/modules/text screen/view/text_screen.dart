import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/text%20screen/widgets/custom_btn.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        tablet: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: _textBody()),
        desktop: Padding(
            padding: const EdgeInsets.only(top: 40, left: 230, bottom: 40),
            child: _textBody()),
        mobile: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: _textBody(),
        ));
  }

  Column _textBody() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter Developer & \nMobile App Enthusiast',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          '''Building seamless, high-performance mobile experiences with beautiful, \nresponsive design and powerful functionality.''',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        CustomBtn()
      ],
    );
  }
}
