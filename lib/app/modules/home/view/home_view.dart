import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:portfolio/app/modules/about/view/about_view.dart';
import 'package:portfolio/app/modules/card%20screen/view/card_screen.dart';
import 'package:portfolio/app/modules/contact%20screen/view/contact_screen.dart';
import 'package:portfolio/app/modules/footer/view/footer_screen.dart';
import 'package:portfolio/app/modules/text%20screen/view/text_screen.dart';
import 'package:portfolio/app/utils/frag_shader.dart';

import '../widgets/app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();

  final homeKey = GlobalKey();
  final workKey = GlobalKey();
  final aboutKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            backgroundColor: Color(0xFF11071F),
            toolbarHeight: 140,
            flexibleSpace: CustomAppBar(
              onMenuTap: (section) {
                switch (section) {
                  case 'Home':
                    scrollToSection(homeKey);
                    break;
                  case 'Work':
                    scrollToSection(workKey);
                    break;
                  case 'About':
                    scrollToSection(aboutKey);
                    break;
                  case 'Contact':
                    scrollToSection(contactKey);
                    break;
                }
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(key: homeKey, child: const TextScreen()),
                Container(key: workKey, child: const CardScreen()),
                Container(key: aboutKey, child: const AboutView()),
                Container(key: contactKey, child: const ContactScreen()),
                const FooterScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
