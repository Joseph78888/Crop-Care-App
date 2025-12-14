import 'dart:async';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
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
import '/presentation/screens/splash_screen.dart';
import '/presentation/providers/locale_provider.dart';
import '/core/theme/app_theme.dart';

/// Global variable to track onboarding status
bool _hasCompletedOnboarding = false;

/// Global variable to track if Firebase initialized successfully
bool firebaseInitialized = false;

/// Provider to track initialization status
final initializationProvider = StateProvider<bool>((ref) => false);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Run app immediately with splash screen
  runApp(const ProviderScope(child: MyApp()));
}

/// Performs all async initialization tasks
/// Strategy: "Fire and Forget" for network services to ensure app NEVER hangs.
Future<void> _initializeApp(WidgetRef ref) async {
  final stopwatch = Stopwatch()..start();

  // 1. SharedPreferences (CRITICAL - Local & Fast)
  try {
    final prefs = await SharedPreferences.getInstance();
    _hasCompletedOnboarding = prefs.getBool('onboarding_completed') ?? false;
  } catch (e) {
    log('Critical: Failed to load SharedPreferences: $e');
    // Default to onboarding if prefs fail
    _hasCompletedOnboarding = false;
  }

  // 2. Background Initializations (NON-BLOCKING)
  // We start these but DO NOT await them. They will finish whenever they can.
  // This ensures the splash screen never hangs due to network issues.

  // Start Firebase & Notifications in background
  _initFirebaseBackground();

  // Start Sentry in background
  _initSentryBackground();

  // 3. Minimum Splash Duration (UX)
  // Ensure splash shows for at least 4 seconds so it doesn't just flash
  final elapsed = stopwatch.elapsedMilliseconds;
  if (elapsed < 2000) {
    await Future.delayed(Duration(milliseconds: 4000 - elapsed));
  }

  log('Splash completed in ${stopwatch.elapsedMilliseconds}ms. App ready.');

  // 4. Unblock UI in 6 seconds
  await Future.delayed(const Duration(seconds: 6));
  ref.read(initializationProvider.notifier).state = true;
}

/// Initialize Firebase in background - purely fire-and-forget
Future<void> _initFirebaseBackground() async {
  try {
    // Try to init Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).timeout(
      const Duration(seconds: 5),
    ); // generous timeout since it's background

    firebaseInitialized = true;
    log('Background: Firebase initialized successfully');

    // Once Firebase is ready, try notifications
    try {
      await initializeNotifications();
      log('Background: Notifications initialized successfully');
    } catch (e) {
      log('Background: Notification init failed: $e');
    }
  } catch (e) {
    log('Background: Firebase init failed (offline?): $e');
    firebaseInitialized = false;
  }
}

/// Initialize Sentry in background - purely fire-and-forget
Future<void> _initSentryBackground() async {
  try {
    await SentryFlutter.init((options) {
      options.dsn = dotenv.env['SENTRY_DSN'];
      options.tracesSampleRate = 1.0;
    }).timeout(const Duration(seconds: 5));
    log('Background: Sentry initialized');
  } catch (e) {
    log('Background: Sentry init failed: $e');
  }
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // Start initialization after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeApp(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch initialization status
    final isInitialized = ref.watch(initializationProvider);
    // Watch locale for dynamic language changes
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
      home: SplashScreen(
        isInitialized: isInitialized,
        child: _hasCompletedOnboarding
            ? const TabsScreen()
            : const OnboardingScreen(),
      ),
    );
  }
}
