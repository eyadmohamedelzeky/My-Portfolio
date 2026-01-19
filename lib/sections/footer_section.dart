import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: AppColors.textPrimary,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            AppStrings.contact,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(FontAwesomeIcons.github, AppStrings.github),
              _buildSocialButton(
                FontAwesomeIcons.linkedin,
                AppStrings.linkedin,
              ),
              _buildSocialButton(Icons.email, "mailto:${AppStrings.email}"),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "© 2026 All rights reserved.",
            style: const TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon, color: Colors.white),
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
    );
  }
}
