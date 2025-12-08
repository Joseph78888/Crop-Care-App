import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

/// Provider for managing app locale
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

/// Notifier for managing locale state
class LocaleNotifier extends StateNotifier<Locale> {
  static const String _localeKey = 'app_locale';

  LocaleNotifier() : super(const Locale('en')) {
    _loadLocale();
  }

  /// Load saved locale from SharedPreferences or use device locale
  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocaleCode = prefs.getString(_localeKey);

    if (savedLocaleCode != null) {
      // User has previously selected a language, use it
      state = Locale(savedLocaleCode);
    } else {
      // First launch: detect device language
      final deviceLocale = ui.PlatformDispatcher.instance.locale;
      final languageCode = deviceLocale.languageCode;

      // Check if device language is Arabic, otherwise default to English
      final localeCode = (languageCode == 'ar') ? 'ar' : 'en';
      state = Locale(localeCode);

      // Save the detected locale for future launches
      await prefs.setString(_localeKey, localeCode);
    }
  }

  /// Change the app locale and save to SharedPreferences
  Future<void> setLocale(Locale locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }

  /// Get the current locale language code
  String get languageCode => state.languageCode;
}
