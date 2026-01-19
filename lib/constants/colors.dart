import 'package:flutter/material.dart';

class AppColors {
  // Modern Dark/Blue Theme Palette
  static const Color primary = Color(0xFF2563EB); // Royal Blue
  static const Color primaryDark = Color(0xFF1E40AF); // Darker Blue
  static const Color accent = Color(0xFF38BDF8); // Sky Blue

  static const Color background = Color(0xFFF8FAFC); // Slate 50
  static const Color surface = Colors.white;

  static const Color textPrimary = Color(0xFF0F172A); // Slate 900
  static const Color textSecondary = Color(0xFF475569); // Slate 600
  static const Color textLight = Color(0xFF94A3B8); // Slate 400

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2563EB), Color(0xFF1E3A8A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const BoxShadow subtleShadow = BoxShadow(
    color: Color.fromRGBO(148, 163, 184, 0.1),
    blurRadius: 10,
    offset: Offset(0, 4),
  );

  static const BoxShadow itemShadow = BoxShadow(
    color: Color.fromRGBO(37, 99, 235, 0.2), // Blueish shadow
    blurRadius: 15,
    offset: Offset(0, 8),
  );
}
