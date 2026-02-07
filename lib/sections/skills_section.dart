import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../widgets/hover_scale.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            AppStrings.skills,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          _buildSkillCategory(
            context,
            "Flutter & Mobile",
            AppStrings.flutterSkills,
            isDark,
          ),
          const SizedBox(height: 30),
          _buildSkillCategory(
            context,
            "Languages",
            AppStrings.languages,
            isDark,
          ),
          const SizedBox(height: 30),
          _buildSkillCategory(
            context,
            "Soft Skills",
            AppStrings.softSkills,
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    List<String> skills,
    bool isDark,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: isDark
                ? AppColors.textSecondary
                : AppColors.lightTextSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: skills
              .map((skill) => _buildSkillChip(context, skill))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return HoverScale(
      builder: (isHovering) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isHovering
              ? AppColors.primary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isHovering
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(
                alpha: isHovering ? 0.3 : 0.05,
              ),
              blurRadius: isHovering ? 15 : 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isHovering
                ? Colors.white
                : Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
