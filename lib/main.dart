import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'core/firebase_options.dart';

import 'package:crop_care_app/generated/l10n.dart';
import '/data/datasources/local/notification_local_data_source.dart';
import '/presentation/screens/tabs_screen.dart';
import '/presentation/providers/locale_provider.dart';
import '/core/theme/app_theme.dart';

void main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await loadNotificationPreference();

  await SentryFlutter.init((options) {
    options.dsn =
        'https://d496e915ceb7cbe361f4c157b69ce773@o4510458440056832.ingest.us.sentry.io/4510458441039872';
    // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
    // We recommend adjusting this value in production.
    options.tracesSampleRate = 1.0;
  }, appRunner: () => runApp(SentryWidget(child: ProviderScope(child: MyApp()))));
  await Sentry.captureException(Exception('This is a sample exception.'));
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
      home: const TabsScreen(),
    );
  }
}
