import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/capture_screen.dart';
import 'presentation/screens/result_screen.dart';
import 'presentation/screens/ai_analysis_screen.dart';
import 'presentation/screens/recommendations_screen.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/history_screen.dart';

void main() {
  runApp(const CropCareApp());
}

class CropCareApp extends StatelessWidget {
  const CropCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crop Care',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        CaptureScreen.routeName: (_) => const CaptureScreen(),
        AIAnalysisScreen.routeName: (_) => const AIAnalysisScreen(),
        ResultScreen.routeName: (_) => const ResultScreen(),
        RecommendationsScreen.routeName: (_) => const RecommendationsScreen(),
        HistoryScreen.routeName: (_) => const HistoryScreen(),
      },
    );
  }
}

