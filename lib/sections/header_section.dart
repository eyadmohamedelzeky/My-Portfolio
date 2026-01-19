import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../main.dart';
import 'dart:async';
import '../widgets/hover_scale.dart';

class HeaderSection extends StatefulWidget {
  final Function(int index) onNavMenuClick;

  const HeaderSection({super.key, required this.onNavMenuClick});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 800;
              return Row(
                mainAxisAlignment: isMobile
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.spaceBetween,
                children: [
                  if (!isMobile) _buildDesktopNavBar(),
                  _buildLanguageToggle(),
                ],
              );
            },
          ),
          const SizedBox(height: 60),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 800;
              return isMobile
                  ? Column(children: _buildContent(isMobile))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _buildContent(isMobile),
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopNavBar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _navButton(AppStrings.navHome, 0),
        _navButton(AppStrings.navAbout, 1),
        _navButton(AppStrings.navExperience, 2),
        _navButton(AppStrings.navEducation, 3),
        _navButton(AppStrings.navSkills, 4),
        _navButton(AppStrings.navProjects, 5),
        _navButton(AppStrings.navContact, 6),
      ],
    );
  }

  Widget _navButton(String text, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => widget.onNavMenuClick(index),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent(bool isMobile) {
    final textContent = Expanded(
      flex: isMobile ? 0 : 3,
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.name,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 10),
          Text(
            AppStrings.jobTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.w300,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_on, color: Colors.white70, size: 16),
              const SizedBox(width: 8),
              Text(
                AppStrings.location,
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.phone, color: Colors.white70, size: 16),
              const SizedBox(width: 8),
              // Typewriter Animation for Phone
              TypewriterText(
                text: AppStrings.phone,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              _buildSocialButton(
                icon: FontAwesomeIcons.linkedin,
                url: AppStrings.linkedin,
              ),
              const SizedBox(width: 20),
              _buildSocialButton(
                icon: FontAwesomeIcons.github,
                url: AppStrings.github,
              ),
              const SizedBox(width: 20),
              _buildSocialButton(
                icon: Icons.email,
                url: "mailto:${AppStrings.email}",
              ),
            ],
          ),
        ],
      ),
    );

    final imageContent = Expanded(
      flex: isMobile ? 0 : 2,
      child: Column(
        children: [
          SizedBox(height: isMobile ? 40 : 0),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 120, // Larger image
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/my_photo.jpg'),
            ),
          ),
        ],
      ),
    );

    // Using natural order in Row: [Text, Image]
    // In LTR: Text Left, Image Right.
    // In RTL: Text Right, Image Left.
    // This matches standard mirroring behavior.
    return [textContent, imageContent];
  }

  Widget _buildLanguageToggle() {
    return HoverScale(
      builder: (isHovering) => Container(
        decoration: BoxDecoration(
          color: isHovering
              ? AppColors.primary.withValues(alpha: 0.8)
              : Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isHovering ? Colors.white : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _langButton("EN", Language.en, isHovering),
            _langButton("عربي", Language.ar, isHovering),
          ],
        ),
      ),
    );
  }

  Widget _langButton(String text, Language lang, bool isParentHovering) {
    bool isSelected = AppStrings.currentLanguage == lang;
    return InkWell(
      onTap: () {
        languageNotifier.value = lang;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.primary : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({required IconData icon, required String url}) {
    return HoverScale(
      builder: (isHovering) => InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isHovering
                ? Colors.white
                : Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isHovering
                  ? AppColors.primary
                  : Colors.white.withValues(alpha: 0.2),
            ),
          ),
          child: Icon(
            icon,
            color: isHovering ? AppColors.primary : Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  const TypewriterText({
    super.key,
    required this.text,
    required this.style,
    this.duration = const Duration(milliseconds: 100),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayedText = "";
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    if (mounted) {
      setState(() {
        _displayedText = "";
        _currentIndex = 0;
      });
    }

    _timer = Timer.periodic(widget.duration, (timer) {
      if (!mounted) return;
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayedText += widget.text[_currentIndex];
          _currentIndex++;
        });
      } else {
        _timer?.cancel();
        // Optional loop:
        // Future.delayed(const Duration(seconds: 3), () => _startAnimation());
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _timer?.cancel();
      _startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.style,
      textDirection: TextDirection.ltr, // Phone numbers are usually LTR always
    );
  }
}
