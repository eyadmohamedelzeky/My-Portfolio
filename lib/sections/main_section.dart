import 'package:flutter/material.dart';
import 'header_section.dart';
import 'about_section.dart';
import 'experience_section.dart';
import 'education_section.dart';
import 'skills_section.dart';
import 'projects_section.dart';
import 'footer_section.dart';
import '../widgets/scroll_reveal.dart';

class MainSection extends StatefulWidget {
  const MainSection({super.key});

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  // 0: Header, 1: About, 2: Experience, 3: Education, 4: Skills, 5: Projects, 6: Footer
  final List<GlobalKey> _sectionKeys = List.generate(7, (_) => GlobalKey());
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollProvider(
      scrollController: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeaderSection(
              key: _sectionKeys[0],
              onNavMenuClick: _scrollToSection,
            ),
            ScrollReveal(child: AboutSection(key: _sectionKeys[1])),
            ScrollReveal(child: ExperienceSection(key: _sectionKeys[2])),
            ScrollReveal(child: EducationSection(key: _sectionKeys[3])),
            ScrollReveal(child: SkillsSection(key: _sectionKeys[4])),
            ScrollReveal(child: ProjectsSection(key: _sectionKeys[5])),
            FooterSection(key: _sectionKeys[6]),
          ],
        ),
      ),
    );
  }
}
