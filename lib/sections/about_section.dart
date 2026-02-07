import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            AppStrings.aboutMe,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.neonCyan,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              AppStrings.aboutDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isDark
                    ? AppColors.textSecondary
                    : AppColors.lightTextSecondary,
                height: 1.8,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
