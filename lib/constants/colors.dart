import 'package:flutter/material.dart';

class AppColors {
  // Modern Dark Theme with Neon Cyan Accents
  static const Color darkBackground = Color(0xFF081b29); // Deep Navy/Black
  static const Color darkSurface = Color(0xFF0a1e2e); // Slightly lighter navy
  static const Color neonCyan = Color(0xFF00abf0); // Vibrant Neon Cyan
  static const Color neonCyanDark = Color(0xFF0088cc); // Darker Cyan

  // Legacy colors (keeping for backward compatibility)
  static const Color primary = neonCyan;
  static const Color primaryDark = neonCyanDark;
  static const Color accent = Color(0xFF00d4ff); // Lighter Cyan

  static const Color background = darkBackground;
  static const Color surface = darkSurface;

  // Text colors for dark theme
  static const Color textPrimary = Color(0xFFFFFFFF); // White
  static const Color textSecondary = Color(0xFFE0E0E0); // Light Gray
  static const Color textLight = Color(0xFFB0B0B0); // Medium Gray

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00abf0), Color(0xFF0088cc)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Glow shadow effects
  static BoxShadow neonGlow = BoxShadow(
    color: neonCyan.withOpacity(0.5),
    blurRadius: 20,
    spreadRadius: 2,
    offset: const Offset(0, 0),
  );

  static BoxShadow subtleGlow = BoxShadow(
    color: neonCyan.withOpacity(0.3),
    blurRadius: 15,
    spreadRadius: 1,
    offset: const Offset(0, 0),
  );

  static const BoxShadow subtleShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.3),
    blurRadius: 10,
    offset: Offset(0, 4),
  );

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFF0F2F5); // Light Grayish Blue
  static const Color lightSurface = Color(0xFFFFFFFF); // White
  static const Color lightTextPrimary = Color(0xFF1F2937); // Dark Gray
  static const Color lightTextSecondary = Color(0xFF4B5563); // Medium Gray
  static const Color lightTextLight = Color(
    0xFF9CA3AF,
  ); // Light Gray for metadata

  static BoxShadow itemShadow = BoxShadow(
    color: neonCyan.withOpacity(0.2),
    blurRadius: 15,
    offset: const Offset(0, 8),
  );
}
