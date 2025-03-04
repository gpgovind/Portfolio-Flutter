import 'package:flutter/material.dart';
import 'package:portfolio/app/core/app_color.dart';
import 'package:portfolio/app/modules/card%20screen/widgets/card_widget.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      color: AppColor.cardScreen,
      child: Responsive(
        mobile: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Project',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              const Text(
                'Select Project',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              const Text(
                'Select Project',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  _body() {
    return Wrap(
      children: List.generate(
        3,
        (index) => const ProjectCard(),
      ),
    );
  }

  _bodyDesktop() {
    return Wrap(
      children: List.generate(
        3,
        (index) => const ProjectCard(),
      ),
    );
  }
}
