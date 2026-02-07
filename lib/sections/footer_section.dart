import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            AppStrings.contact,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(
                context,
                FontAwesomeIcons.github,
                AppStrings.github,
              ),
              _buildSocialButton(
                context,
                FontAwesomeIcons.linkedin,
                AppStrings.linkedin,
              ),
              _buildSocialButton(
                context,
                Icons.email,
                "mailto:${AppStrings.email}",
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "© 2026 All rights reserved.",
            style: TextStyle(
              color: isDark
                  ? Colors.white54
                  : AppColors.lightTextLight.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon, color: Theme.of(context).colorScheme.onSurface),
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
    );
  }
}
