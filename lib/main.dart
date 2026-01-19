import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/strings.dart';
import 'widgets/splash_screen.dart';

final ValueNotifier<Language> languageNotifier = ValueNotifier(Language.en);

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
        return MaterialApp(
          title: 'My Portfolio',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2563EB),
            ),
            useMaterial3: true,
            fontFamily: language == Language.ar
                ? 'Cairo'
                : GoogleFonts.bricolageGrotesque().fontFamily,
            textTheme: language == Language.ar
                ? GoogleFonts.cairoTextTheme()
                : GoogleFonts.bricolageGrotesqueTextTheme(),
          ),
          builder: (context, child) {
            return Directionality(
              textDirection: language == Language.ar
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: child!,
            );
          },
          home: const SplashScreen(),
        );
      },
    );
  }
}
