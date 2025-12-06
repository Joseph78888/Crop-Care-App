// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `crop care`
  String get appTitle {
    return Intl.message('crop care', name: 'appTitle', desc: '', args: []);
  }

  /// `Welcome to Crop Care`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to Crop Care',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `AI-powered disease detection`
  String get welcomeSubtitle {
    return Intl.message(
      'AI-powered disease detection',
      name: 'welcomeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `How can we help your crop today!`
  String get howWeCanHelp {
    return Intl.message(
      'How can we help your crop today!',
      name: 'howWeCanHelp',
      desc: '',
      args: [],
    );
  }

  /// `Capture Image`
  String get captureImage {
    return Intl.message(
      'Capture Image',
      name: 'captureImage',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo of your crop leaf`
  String get captureSubtitle {
    return Intl.message(
      'Take a photo of your crop leaf',
      name: 'captureSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uploadeImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadeImage',
      desc: '',
      args: [],
    );
  }

  /// `Select from your gallery`
  String get uploadeImageSubtitle {
    return Intl.message(
      'Select from your gallery',
      name: 'uploadeImageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Quick Status`
  String get quichStatus {
    return Intl.message(
      'Quick Status',
      name: 'quichStatus',
      desc: '',
      args: [],
    );
  }

  /// `Accuracy Rate`
  String get accuracyRate {
    return Intl.message(
      'Accuracy Rate',
      name: 'accuracyRate',
      desc: '',
      args: [],
    );
  }

  /// ` Crop Analyzed`
  String get cropAnalayzed {
    return Intl.message(
      ' Crop Analyzed',
      name: 'cropAnalayzed',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
