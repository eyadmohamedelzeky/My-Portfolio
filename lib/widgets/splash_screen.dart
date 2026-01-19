import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../sections/main_section.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const Scaffold(body: MainSection()),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Loading Icon / Logo representation
            const Icon(
                  Icons.code,
                  size: 80,
                  color: Color(0xFF2563EB), // Primary Blue
                )
                .animate()
                .scale(duration: 600.ms, curve: Curves.easeOutBack)
                .then(delay: 200.ms)
                .shimmer(duration: 1200.ms, color: Colors.blueAccent),

            const SizedBox(height: 20),

            // Loading Text
            Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    letterSpacing: 1.2,
                  ),
                )
                .animate()
                .fadeIn(delay: 500.ms, duration: 500.ms)
                .tint(color: const Color(0xFF2563EB), duration: 1000.ms),

            const SizedBox(height: 20),

            // Simple Progress Bar
            SizedBox(
              width: 150,
              child: const LinearProgressIndicator(
                backgroundColor: Color(0xFFE0E0E0),
                color: Color(0xFF2563EB),
                minHeight: 4,
              ).animate().fadeIn(delay: 800.ms),
            ),
          ],
        ),
      ),
    );
  }
}
