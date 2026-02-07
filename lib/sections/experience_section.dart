import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../widgets/hover_scale.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Text(
            AppStrings.experience,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: AppStrings.experienceList.map((experience) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _buildExperienceCard(context, experience),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(
    BuildContext context,
    Map<String, String> experience,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return HoverScale(
      builder: (isHovering) => Card(
        elevation: isHovering ? 4 : 0,
        color: isHovering
            ? Theme.of(context).colorScheme.surface.withValues(alpha: 0.8)
            : Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isHovering
                ? AppColors.primary
                : Theme.of(context).dividerColor.withValues(alpha: 0.1),
            width: isHovering ? 1.5 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.work, color: AppColors.primary),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          experience["role"]!,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${experience["company"]} • ${experience["type"]}",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: isDark
                                    ? AppColors.textSecondary
                                    : AppColors.lightTextSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    experience["date"]!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? AppColors.textLight
                          : AppColors.lightTextLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                experience["description"]!,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isDark
                      ? AppColors.textSecondary
                      : AppColors.lightTextSecondary,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
