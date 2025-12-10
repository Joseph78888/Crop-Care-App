import 'package:crop_care_app/core/utils/responsive_helper.dart';
import 'package:crop_care_app/generated/l10n.dart';
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
              width: context.responsive.rs(280),
              height: context.responsive.rs(280),
              fit: BoxFit.contain,
              repeat: true,
            ),
            SizedBox(height: context.responsive.rs(24)),
            // App name
            Text(
              S.of(context).appTitle,
              style: TextStyle(
                fontSize: context.responsive.sp(32),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF22C55E),
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: context.responsive.rs(8)),
            // Tagline
            Text(
              S.of(context).welcomeSubtitle,
              style: TextStyle(
                fontSize: context.responsive.sp(14),
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: context.responsive.rs(40)),
            // Loading indicator
            SizedBox(
              width: context.responsive.rs(24),
              height: context.responsive.rs(24),
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
