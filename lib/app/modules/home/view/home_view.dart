import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/about/view/about_view.dart';
import 'package:portfolio/app/modules/card%20screen/view/card_screen.dart';
import 'package:portfolio/app/modules/contact%20screen/view/contact_screen.dart';
import 'package:portfolio/app/modules/footer/view/footer_screen.dart';
import 'package:portfolio/app/modules/text%20screen/view/text_screen.dart';

import '../widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const TextScreen();
            } else if (index == 1) {
              return const CardScreen();
            } else if (index == 2) {
              return const AboutView();
            } else if (index == 3) {
              return const ContactScreen();
            } else {
              return const FooterScreen();
            }
          },
        ));
  }
}
