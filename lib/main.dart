import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/firebase_options.dart';

import '/generated/l10n.dart';
import '/data/datasources/local/notification_local_data_source.dart';
import '/presentation/screens/tabs_screen.dart';
import '/presentation/screens/onboarding_screen.dart';
import '/presentation/providers/locale_provider.dart';
import '/core/theme/app_theme.dart';

/// Global variable to track onboarding status
bool _hasCompletedOnboarding = false;

/// Global variable to track if Firebase initialized successfully
bool firebaseInitialized = false;

void main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with timeout (graceful failure for offline support)
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).timeout(
      const Duration(seconds: 3),
      onTimeout: () => throw TimeoutException('Firebase timeout'),
    );
    firebaseInitialized = true;
    log('Firebase initialized successfully');
  } catch (e) {
    log('Firebase initialization failed (offline?): $e');
    firebaseInitialized = false;
  }

  // Initialize notifications only if Firebase is available
  if (firebaseInitialized) {
    try {
      await initializeNotifications();
      log('Notifications initialized successfully');
    } catch (e) {
      log('Notification initialization failed (offline?): $e');
    }
  }

  // Check if onboarding has been completed
  final prefs = await SharedPreferences.getInstance();
  _hasCompletedOnboarding = prefs.getBool('onboarding_completed') ?? false;

  // Initialize Sentry with timeout (graceful failure for offline support)
  try {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://d496e915ceb7cbe361f4c157b69ce773@o4510458440056832.ingest.us.sentry.io/4510458441039872';
        options.tracesSampleRate = 1.0;
      },
      appRunner: () =>
          runApp(SentryWidget(child: ProviderScope(child: MyApp()))),
    ).timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        log('Sentry initialization timed out, running without Sentry');
        runApp(const ProviderScope(child: MyApp()));
      },
    );
  } catch (e) {
    log('Sentry initialization failed (offline?): $e');
    // Run app without Sentry wrapper
    runApp(const ProviderScope(child: MyApp()));
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the locale provider for dynamic language changes
    final locale = ref.watch(localeProvider);

    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: locale,
      title: 'Crop Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF22C55E),
          primary: const Color(0xFF22C55E),
          secondary: const Color(0xFFEAB308),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
        ),

        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          margin: const EdgeInsets.all(8),
        ),
      ),
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: _hasCompletedOnboarding
          ? const TabsScreen()
          : const OnboardingScreen(),
    );
  }
}
