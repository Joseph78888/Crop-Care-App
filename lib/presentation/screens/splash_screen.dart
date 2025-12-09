import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Animated splash screen shown during app initialization.
/// Uses a Lottie animation to provide visual feedback while
/// Firebase, Sentry, and other services are loading.
class SplashScreen extends StatelessWidget {
  final Widget child;
  final bool isInitialized;

  const SplashScreen({
    super.key,
    required this.child,
    required this.isInitialized,
  });

  @override
  Widget build(BuildContext context) {
    // Show main app when initialized
    if (isInitialized) {
      return child;
    }

    // Show splash screen during initialization
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9), // Light green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation
            Lottie.asset(
              'assets/animations/Agriculture_technology.json',
              width: 280,
              height: 280,
              fit: BoxFit.contain,
              repeat: true,
            ),
            const SizedBox(height: 24),
            // App name
            const Text(
              'Crop Care',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF22C55E),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            // Tagline
            Text(
              'AI-Powered Plant Disease Detection',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 40),
            // Loading indicator
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: const Color(0xFF22C55E).withAlpha(180),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
