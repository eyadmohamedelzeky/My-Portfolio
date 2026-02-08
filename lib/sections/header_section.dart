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
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildThemeToggle(),
                      const SizedBox(width: 10),
                      _buildLanguageToggle(),
                    ],
                  ),
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

  // ... (NavBar methods refer to context so they should be fine if built inside build)

  // skipping down to SequentialTypewriter updates

  // Note: I will need to update SequentialTypewriter widget separately below because it's a separate class.
  // Wait, I can't update two separate classes in one chunk if they are far apart, but here I am modifying HeaderSection.

  // Let me just update the Container decoration first in HeaderSection.

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
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
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
      child: SequentialTypewriter(isMobile: isMobile),
    );

    final imageContent = Expanded(
      flex: isMobile ? 0 : 2,
      child: Column(
        children: [
          SizedBox(height: isMobile ? 40 : 0),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.neonCyan.withValues(alpha: 0.5),
                  blurRadius: 30,
                  spreadRadius: 2,
                ),
              ],
              border: Border.all(color: AppColors.neonCyan, width: 3),
            ),
            child: ClipOval(
              child: SizedBox(
                width: 240,
                height: 240,
                child: Image.asset(
                  'assets/images/my_photo.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
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

  Widget _buildThemeToggle() {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        return IconButton(
          onPressed: () {
            themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
          },
          icon: Icon(
            isDark ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        );
      },
    );
  }

  Widget _buildLanguageToggle() {
    return HoverScale(
      builder: (isHovering) => Container(
        decoration: BoxDecoration(
          color: isHovering
              ? AppColors.primary.withValues(alpha: 0.8)
              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        languageNotifier.value = lang;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? Colors.white : AppColors.primary)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? (isDark ? AppColors.primary : Colors.white)
                : (isDark ? Colors.white : AppColors.textPrimary),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Sequential Typewriter Widget
class SequentialTypewriter extends StatefulWidget {
  final bool isMobile;

  const SequentialTypewriter({super.key, required this.isMobile});

  @override
  State<SequentialTypewriter> createState() => _SequentialTypewriterState();
}

class _SequentialTypewriterState extends State<SequentialTypewriter> {
  int _currentStep = 0; // 0: name, 1: jobTitle, 2: phone
  Timer? _sequenceTimer;

  @override
  void initState() {
    super.initState();
    _startSequence();
  }

  void _startSequence() {
    setState(() {
      _currentStep = 0;
    });
  }

  void _onStepComplete(int step) {
    if (!mounted) return;

    if (step == 0) {
      // Name completed, move to job title
      setState(() {
        _currentStep = 1;
      });
    } else if (step == 1) {
      // Job title completed, move to phone
      setState(() {
        _currentStep = 2;
      });
    } else if (step == 2) {
      // Phone completed, stop the sequence
      // The text will remain visible because the current step will stay at 2
    }
  }

  @override
  void dispose() {
    _sequenceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Column(
      crossAxisAlignment: widget.isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SequentialTypewriterText(
          text: AppStrings.name,
          style:
              Theme.of(context).textTheme.displayMedium?.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ) ??
              TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 48,
              ),
          duration: const Duration(milliseconds: 100),
          textAlign: widget.isMobile ? TextAlign.center : TextAlign.start,
          shouldAnimate: _currentStep >= 0,
          onComplete: () => _onStepComplete(0),
        ),
        const SizedBox(height: 10),
        SequentialTypewriterText(
          text: AppStrings.jobTitle,
          style:
              Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: textColor.withValues(alpha: 0.9),
                fontWeight: FontWeight.w300,
              ) ??
              TextStyle(
                color: textColor.withValues(alpha: 0.9),
                fontWeight: FontWeight.w300,
                fontSize: 24,
              ),
          duration: const Duration(milliseconds: 100),
          textAlign: widget.isMobile ? TextAlign.center : TextAlign.start,
          shouldAnimate: _currentStep >= 1,
          onComplete: () => _onStepComplete(1),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: widget.isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on,
              color: textColor.withValues(alpha: 0.7),
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              AppStrings.location,
              style: TextStyle(color: textColor.withValues(alpha: 0.7)),
            ),
            const SizedBox(width: 20),
            Icon(
              Icons.phone,
              color: textColor.withValues(alpha: 0.7),
              size: 16,
            ),
            const SizedBox(width: 8),
            SequentialTypewriterText(
              text: AppStrings.phone,
              style: TextStyle(color: textColor.withValues(alpha: 0.7)),
              duration: const Duration(milliseconds: 100),
              shouldAnimate: _currentStep >= 2,
              onComplete: () => _onStepComplete(2),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: widget.isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            _buildSocialButton(
              context,
              icon: FontAwesomeIcons.linkedin,
              url: AppStrings.linkedin,
            ),
            const SizedBox(width: 20),
            _buildSocialButton(
              context,
              icon: FontAwesomeIcons.github,
              url: AppStrings.github,
            ),
            const SizedBox(width: 20),
            _buildSocialButton(
              context,
              icon: Icons.email,
              url: "mailto:${AppStrings.email}",
            ),
          ],
        ),
        const SizedBox(height: 30),
        HoverScale(
          builder: (isHovering) => ElevatedButton.icon(
            onPressed: () async {
              const url =
                  'https://docs.google.com/document/d/112AJ5Y5HxqdZmCHB6dmHUjLiUdmvqCiY/export?format=pdf';
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                await launchUrl(uri);
              }
            },
            icon: Icon(
              Icons.download_rounded,
              color: isHovering
                  ? AppColors.darkBackground
                  : Theme.of(context).colorScheme.onSurface,
            ),
            label: Text(
              "Download CV",
              style: TextStyle(
                color: isHovering
                    ? AppColors.darkBackground
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: isHovering
                  ? AppColors.neonCyan
                  : Colors.transparent,
              foregroundColor: isHovering
                  ? AppColors.darkBackground
                  : Theme.of(context).colorScheme.onSurface,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              side: const BorderSide(color: AppColors.neonCyan, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              shadowColor: AppColors.neonCyan.withOpacity(0.5),
              elevation: isHovering ? 10 : 0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required IconData icon,
    required String url,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
                ? AppColors.neonCyan
                : (isDark
                      ? AppColors.darkSurface
                      : Theme.of(context).colorScheme.surface),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.neonCyan, width: 2),
            boxShadow: isHovering
                ? [
                    AppColors.neonGlow,
                    BoxShadow(
                      color: AppColors.neonCyan.withValues(alpha: 0.5),
                      blurRadius: 25,
                      spreadRadius: 3,
                      offset: const Offset(0, 0),
                    ),
                  ]
                : [AppColors.subtleGlow],
          ),
          child: Icon(
            icon,
            color: isHovering
                ? AppColors.darkBackground
                : (isDark ? AppColors.neonCyan : AppColors.neonCyanDark),
            size: 24,
          ),
        ),
      ),
    );
  }
}

// Sequential Typewriter Text Widget
class SequentialTypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final TextAlign? textAlign;
  final bool shouldAnimate;
  final VoidCallback onComplete;

  const SequentialTypewriterText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 100),
    this.textAlign,
    required this.shouldAnimate,
    required this.onComplete,
  });

  @override
  State<SequentialTypewriterText> createState() =>
      _SequentialTypewriterTextState();
}

class _SequentialTypewriterTextState extends State<SequentialTypewriterText> {
  String _displayedText = "";
  int _currentIndex = 0;
  Timer? _timer;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    if (widget.shouldAnimate) {
      _startAnimation();
    }
  }

  @override
  void didUpdateWidget(SequentialTypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldAnimate && !oldWidget.shouldAnimate) {
      _startAnimation();
    } else if (!widget.shouldAnimate && oldWidget.shouldAnimate) {
      _reset();
    }
  }

  void _reset() {
    _timer?.cancel();
    if (mounted) {
      setState(() {
        _displayedText = "";
        _currentIndex = 0;
        _hasAnimated = false;
      });
    }
  }

  void _startAnimation() {
    if (_hasAnimated) {
      _reset();
    }

    _hasAnimated = true;

    _timer = Timer.periodic(widget.duration, (timer) {
      if (!mounted) return;
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayedText += widget.text[_currentIndex];
          _currentIndex++;
        });
      } else {
        _timer?.cancel();
        widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.style,
      textAlign: widget.textAlign,
      textDirection: widget.textAlign != null ? null : TextDirection.ltr,
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final Duration? loopDelay;
  final TextAlign? textAlign;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 100),
    this.loopDelay,
    this.textAlign,
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
        // Loop if loopDelay is specified
        if (widget.loopDelay != null) {
          Future.delayed(widget.loopDelay!, () {
            if (mounted) {
              _startAnimation();
            }
          });
        }
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
      textAlign: widget.textAlign,
      textDirection: widget.textAlign != null
          ? null
          : TextDirection.ltr, // Phone numbers are usually LTR always
    );
  }
}
