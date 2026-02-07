import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/strings.dart';
import 'sections/main_section.dart';

final ValueNotifier<Language> languageNotifier = ValueNotifier(Language.en);

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Language>(
      valueListenable: languageNotifier,
      builder: (context, language, child) {
        AppStrings.setLanguage(language);
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (context, themeMode, _) {
            return MaterialApp(
              title: 'Eyad Mohamed',
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: const Color(
                  0xFFF0F2F5,
                ), // AppColors.lightBackground
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFF00abf0), // AppColors.neonCyan
                  surface: Color(0xFFFFFFFF), // AppColors.lightSurface,
                  onSurface: Color(0xFF1F2937), // AppColors.lightTextPrimary
                ),
                useMaterial3: true,
                fontFamily: language == Language.ar
                    ? 'Cairo'
                    : GoogleFonts.bricolageGrotesque().fontFamily,
                textTheme: language == Language.ar
                    ? GoogleFonts.cairoTextTheme(ThemeData.light().textTheme)
                    : GoogleFonts.bricolageGrotesqueTextTheme(
                        ThemeData.light().textTheme,
                      ),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: const Color(
                  0xFF081b29,
                ), // AppColors.darkBackground
                colorScheme: const ColorScheme.dark(
                  primary: Color(0xFF00abf0), // AppColors.neonCyan
                  surface: Color(0xFF0a1e2e), // AppColors.darkSurface
                  onSurface: Color(0xFFFFFFFF), // AppColors.textPrimary
                ),
                useMaterial3: true,
                fontFamily: language == Language.ar
                    ? 'Cairo'
                    : GoogleFonts.bricolageGrotesque().fontFamily,
                textTheme: language == Language.ar
                    ? GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme)
                    : GoogleFonts.bricolageGrotesqueTextTheme(
                        ThemeData.dark().textTheme,
                      ),
              ),
              builder: (context, child) {
                return Directionality(
                  textDirection: language == Language.ar
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: child!,
                );
              },
              home: const Scaffold(body: MainSection()),
            );
          },
        );
      },
    );
  }
}
