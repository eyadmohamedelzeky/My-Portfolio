import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../widgets/hover_scale.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
            AppStrings.projects,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: AppStrings.projectList.map((project) {
              return _buildProjectCard(context, project, isDark);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    Map<String, String> project,
    bool isDark,
  ) {
    return HoverScale(
      builder: (isHovering) => Container(
        width: 350,
        // Removed fixed height to allow content to expand
        decoration: BoxDecoration(
          color: isHovering
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            isHovering ? AppColors.itemShadow : AppColors.subtleShadow,
          ],
          border: Border.all(
            color: isHovering
                ? AppColors.primary
                : Theme.of(context).dividerColor.withValues(alpha: 0.1),
            width: isHovering ? 2 : 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
                width: double.infinity,
                color: AppColors.primary,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project["title"]!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    if (project["company"] != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        project["company"]!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    Text(
                      project["description"]!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDark
                            ? AppColors.textSecondary
                            : AppColors.lightTextSecondary,
                        height: 1.5,
                      ),
                      // Removed overflow: TextOverflow.fade
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    Text(
                      project["tech"]!,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (project["google_play"] != null ||
                        project["app_store"] != null) ...[
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          if (project["google_play"] != null)
                            _buildStoreButton(
                              context,
                              icon: FontAwesomeIcons.googlePlay,
                              url: project["google_play"]!,
                              label: "Google Play",
                            ),
                          if (project["app_store"] != null)
                            _buildStoreButton(
                              context,
                              icon: FontAwesomeIcons.appStore,
                              url: project["app_store"]!,
                              label: "App Store",
                            ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreButton(
    BuildContext context, {
    required IconData icon,
    required String url,
    required String label,
  }) {
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isHovering ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.primary),
            boxShadow: isHovering
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: isHovering ? Colors.white : AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isHovering ? Colors.white : AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
