import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/experience/view/about_view.dart';
import 'package:portfolio/app/modules/card%20screen/view/card_screen.dart';
import 'package:portfolio/app/modules/contact%20screen/view/contact_screen.dart';
import 'package:portfolio/app/modules/footer/view/footer_screen.dart';
import 'package:portfolio/app/modules/skills/view/skill_view.dart';
import 'package:portfolio/app/modules/text%20screen/view/text_screen.dart';
import 'package:portfolio/app/utils/app_links.dart';
import 'package:portfolio/app/utils/frag_shader.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';
import '../widgets/app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();

  final homeKey = GlobalKey();
  final skills = GlobalKey();
  final projects = GlobalKey();
  final experience = GlobalKey();
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
      drawer: MediaQuery.of(context).size.width < 600 ? _drawer(context) : null,
      body: Stack(
        children: [
        //  MeteorShowerBackground(),
           Positioned(
              top: 1,
              right: 2,
              child: Image.asset(
                fit: BoxFit.cover,
                AppLinks.backgroundPice,
              )),
                  BirdMigrationBackground(),
          CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                elevation: 0,
                // backgroundColor: Color(0xFF11071F),
                toolbarHeight: 140,
                flexibleSpace: Responsive(
                  mobile: mobileDrawer(),
                  desktop: _customAppBar(),
                  tablet: _customAppBar(),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(key: homeKey, child: const TextScreen()),
                    const SizedBox(height: 40),
                    Container(key: skills, child: SkillsSection()),
                    const SizedBox(height: 40),
                    Container(key: projects, child: CardScreen()),
                    const SizedBox(height: 40),
                    Container(
                        key: experience, child: const ExperienceSection()),
                    const SizedBox(height: 40),
                    Container(key: contactKey, child: const ContactScreen()),
                    const FooterScreen(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children:
            ['Home', 'Skill', 'Projects', 'Experience', 'Contact'].map((label) {
          return ListTile(
            title: Text(label),
            onTap: () {
              Navigator.pop(context);
              switch (label) {
                case 'Home':
                  scrollToSection(homeKey);
                  break;
                case 'Skill':
                  scrollToSection(skills);
                  break;
                case 'Projects':
                  scrollToSection(projects);
                  break;
                case 'Experience':
                  scrollToSection(experience);
                  break;
                case 'Contact':
                  scrollToSection(contactKey);
                  break;
              }
            },
          );
        }).toList(),
      ),
    );
  }

  Widget mobileDrawer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Govind P',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  CustomAppBar _customAppBar() {
    return CustomAppBar(
      onMenuTap: (section) {
        switch (section) {
          case 'Home':
            scrollToSection(homeKey);
            break;
          case 'Skill':
            scrollToSection(skills);
            break;
          case 'Projects':
            scrollToSection(projects);
            break;
          case 'Experience':
            scrollToSection(experience);
            break;
          case 'Contact':
            scrollToSection(contactKey);
            break;
        }
      },
    );
  }
}
