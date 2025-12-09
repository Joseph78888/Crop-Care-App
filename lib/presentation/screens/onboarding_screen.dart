import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crop_care_app/generated/l10n.dart';
import '/presentation/screens/tabs_screen.dart';
import '/core/utils/responsive_helper.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);

    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TabsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return Scaffold(
      backgroundColor: Color(0xFFEBF1F1),
      body: SafeArea(
        child: Column(
          children: [
            // Top section with image
            Expanded(
              flex: 6,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background curved shape
                  Positioned(
                    top: responsive.hp(38),
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: responsive.hp(45),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F9F5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(responsive.rs(60)),
                          topRight: Radius.circular(responsive.rs(60)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: responsive.hp(5),
                    child: Image.asset(
                      'assets/images/onboarding_image.png',
                      height: responsive.hp(45),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: responsive.hp(45),
                    left: 0,
                    right: 0,
                    bottom: responsive.hp(5),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: responsive.lg),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Welcome title
                          Builder(
                            builder: (context) {
                              return Text(
                                S.of(context).onboardingWelcome,
                                style: TextStyle(
                                  fontSize: responsive.sp(32),
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1F2937),
                                  letterSpacing: -0.5,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: responsive.md),

                          // Subtitle
                          Builder(
                            builder: (context) {
                              return Text(
                                S.of(context).onboardingSubtitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: responsive.textMD,
                                  color: const Color(0xFF6B7280),
                                  height: 1.5,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: responsive.xxxl),

                          // Get Started button
                          SizedBox(
                            width: responsive.wp(65),
                            height: responsive.rs(56),
                            child: Builder(
                              builder: (context) {
                                return ElevatedButton(
                                  onPressed: () => _completeOnboarding(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4ADE80),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        responsive.rs(28),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: responsive.textLG,
                                      ),
                                      SizedBox(width: responsive.sm),
                                      Text(
                                        S.of(context).onboardingGetStarted,
                                        style: TextStyle(
                                          fontSize: responsive.textMD,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
