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

  /// `Analysis History`
  String get analysisHistory {
    return Intl.message(
      'Analysis History',
      name: 'analysisHistory',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Healthy`
  String get healthy {
    return Intl.message('Healthy', name: 'healthy', desc: '', args: []);
  }

  /// `Diseased`
  String get diseased {
    return Intl.message('Diseased', name: 'diseased', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Search by disease name...`
  String get searchHint {
    return Intl.message(
      'Search by disease name...',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `No Analysis History`
  String get noAnalysisHistory {
    return Intl.message(
      'No Analysis History',
      name: 'noAnalysisHistory',
      desc: '',
      args: [],
    );
  }

  /// `Start analyzing your crops to see results here`
  String get startAnalyzingMessage {
    return Intl.message(
      'Start analyzing your crops to see results here',
      name: 'startAnalyzingMessage',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Languages`
  String get languages {
    return Intl.message('Languages', name: 'languages', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `العربية`
  String get arabic {
    return Intl.message('العربية', name: 'arabic', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Help & Support`
  String get helpAndSupport {
    return Intl.message(
      'Help & Support',
      name: 'helpAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `User Guide`
  String get userGuide {
    return Intl.message('User Guide', name: 'userGuide', desc: '', args: []);
  }

  /// `Learn how to use crop care`
  String get learnHowToUse {
    return Intl.message(
      'Learn how to use crop care',
      name: 'learnHowToUse',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contactSupport {
    return Intl.message(
      'Contact Support',
      name: 'contactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Get help from our team`
  String get getHelpFromTeam {
    return Intl.message(
      'Get help from our team',
      name: 'getHelpFromTeam',
      desc: '',
      args: [],
    );
  }

  /// `Rate The App`
  String get rateTheApp {
    return Intl.message('Rate The App', name: 'rateTheApp', desc: '', args: []);
  }

  /// `Share your feedback`
  String get shareYourFeedback {
    return Intl.message(
      'Share your feedback',
      name: 'shareYourFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Data & Privacy`
  String get dataAndPrivacy {
    return Intl.message(
      'Data & Privacy',
      name: 'dataAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Clear History`
  String get clearHistory {
    return Intl.message(
      'Clear History',
      name: 'clearHistory',
      desc: '',
      args: [],
    );
  }

  /// `Remove all analysis history`
  String get removeAllHistory {
    return Intl.message(
      'Remove all analysis history',
      name: 'removeAllHistory',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Learn about data usage`
  String get learnAboutDataUsage {
    return Intl.message(
      'Learn about data usage',
      name: 'learnAboutDataUsage',
      desc: '',
      args: [],
    );
  }

  /// `Terms Of Service`
  String get termsOfService {
    return Intl.message(
      'Terms Of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Usage terms and conditions`
  String get usageTermsAndConditions {
    return Intl.message(
      'Usage terms and conditions',
      name: 'usageTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `About Crop Care`
  String get aboutCropCare {
    return Intl.message(
      'About Crop Care',
      name: 'aboutCropCare',
      desc: '',
      args: [],
    );
  }

  /// `Clear History`
  String get clearHistoryTitle {
    return Intl.message(
      'Clear History',
      name: 'clearHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear all analysis history? This action cannot be undone.`
  String get clearHistoryMessage {
    return Intl.message(
      'Are you sure you want to clear all analysis history? This action cannot be undone.',
      name: 'clearHistoryMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `History cleared successfully`
  String get historyCleared {
    return Intl.message(
      'History cleared successfully',
      name: 'historyCleared',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpDialogTitle {
    return Intl.message(
      'Help & Support',
      name: 'helpDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `How to use Crop Care:`
  String get howToUseCropCare {
    return Intl.message(
      'How to use Crop Care:',
      name: 'howToUseCropCare',
      desc: '',
      args: [],
    );
  }

  /// `1. Capture or upload a clear image of the crop leaf`
  String get step1 {
    return Intl.message(
      '1. Capture or upload a clear image of the crop leaf',
      name: 'step1',
      desc: '',
      args: [],
    );
  }

  /// `2. Wait for AI analysis to complete`
  String get step2 {
    return Intl.message(
      '2. Wait for AI analysis to complete',
      name: 'step2',
      desc: '',
      args: [],
    );
  }

  /// `3. Review the disease identification results`
  String get step3 {
    return Intl.message(
      '3. Review the disease identification results',
      name: 'step3',
      desc: '',
      args: [],
    );
  }

  /// `4. Follow the recommended treatment steps`
  String get step4 {
    return Intl.message(
      '4. Follow the recommended treatment steps',
      name: 'step4',
      desc: '',
      args: [],
    );
  }

  /// `5. Check your history for past analyses`
  String get step5 {
    return Intl.message(
      '5. Check your history for past analyses',
      name: 'step5',
      desc: '',
      args: [],
    );
  }

  /// `Tips for better results:`
  String get tipsForBetterResults {
    return Intl.message(
      'Tips for better results:',
      name: 'tipsForBetterResults',
      desc: '',
      args: [],
    );
  }

  /// `• Use good lighting conditions`
  String get tip1 {
    return Intl.message(
      '• Use good lighting conditions',
      name: 'tip1',
      desc: '',
      args: [],
    );
  }

  /// `• Fill the frame with the leaf`
  String get tip2 {
    return Intl.message(
      '• Fill the frame with the leaf',
      name: 'tip2',
      desc: '',
      args: [],
    );
  }

  /// `• Avoid blurry or dark images`
  String get tip3 {
    return Intl.message(
      '• Avoid blurry or dark images',
      name: 'tip3',
      desc: '',
      args: [],
    );
  }

  /// `• Focus on affected areas`
  String get tip4 {
    return Intl.message(
      '• Focus on affected areas',
      name: 'tip4',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotIt {
    return Intl.message('Got it', name: 'gotIt', desc: '', args: []);
  }

  /// `feature coming soon.`
  String get featureComingSoon {
    return Intl.message(
      'feature coming soon.',
      name: 'featureComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your interest! Rating feature coming soon.`
  String get thankYouRating {
    return Intl.message(
      'Thank you for your interest! Rating feature coming soon.',
      name: 'thankYouRating',
      desc: '',
      args: [],
    );
  }

  /// `Crop Care`
  String get cropCare {
    return Intl.message('Crop Care', name: 'cropCare', desc: '', args: []);
  }

  /// `Version 1.0.0`
  String get version {
    return Intl.message('Version 1.0.0', name: 'version', desc: '', args: []);
  }

  /// `AI-Powered Plant Disease Detection`
  String get aiPoweredPlantDisease {
    return Intl.message(
      'AI-Powered Plant Disease Detection',
      name: 'aiPoweredPlantDisease',
      desc: '',
      args: [],
    );
  }

  /// `Helping farmers identify crop diseases with advanced AI technology. Built with care for the agricultural community.`
  String get aboutDescription {
    return Intl.message(
      'Helping farmers identify crop diseases with advanced AI technology. Built with care for the agricultural community.',
      name: 'aboutDescription',
      desc: '',
      args: [],
    );
  }

  /// `Development Team`
  String get developmentTeam {
    return Intl.message(
      'Development Team',
      name: 'developmentTeam',
      desc: '',
      args: [],
    );
  }

  /// `Meet the creators`
  String get meetTheCreators {
    return Intl.message(
      'Meet the creators',
      name: 'meetTheCreators',
      desc: '',
      args: [],
    );
  }

  /// `coming soon.`
  String get comingSoon {
    return Intl.message('coming soon.', name: 'comingSoon', desc: '', args: []);
  }

  /// `2025 Crop Care. Made with`
  String get madeWithLove {
    return Intl.message(
      '2025 Crop Care. Made with',
      name: 'madeWithLove',
      desc: '',
      args: [],
    );
  }

  /// `for farmers worldwide.`
  String get forFarmers {
    return Intl.message(
      'for farmers worldwide.',
      name: 'forFarmers',
      desc: '',
      args: [],
    );
  }

  /// `Analyze Your Crop`
  String get analyzeYourCrop {
    return Intl.message(
      'Analyze Your Crop',
      name: 'analyzeYourCrop',
      desc: '',
      args: [],
    );
  }

  /// `Capture Tips`
  String get captureTips {
    return Intl.message(
      'Capture Tips',
      name: 'captureTips',
      desc: '',
      args: [],
    );
  }

  /// `Take a clear photo of the affected leaf`
  String get captureTip1 {
    return Intl.message(
      'Take a clear photo of the affected leaf',
      name: 'captureTip1',
      desc: '',
      args: [],
    );
  }

  /// `Ensure good lighting conditions`
  String get captureTip2 {
    return Intl.message(
      'Ensure good lighting conditions',
      name: 'captureTip2',
      desc: '',
      args: [],
    );
  }

  /// `Fill the frame with the leaf`
  String get captureTip3 {
    return Intl.message(
      'Fill the frame with the leaf',
      name: 'captureTip3',
      desc: '',
      args: [],
    );
  }

  /// `Avoid blurry or dark images`
  String get captureTip4 {
    return Intl.message(
      'Avoid blurry or dark images',
      name: 'captureTip4',
      desc: '',
      args: [],
    );
  }

  /// `No image selected`
  String get noImageSelected {
    return Intl.message(
      'No image selected',
      name: 'noImageSelected',
      desc: '',
      args: [],
    );
  }

  /// `Analyzing image...`
  String get analyzingImage {
    return Intl.message(
      'Analyzing image...',
      name: 'analyzingImage',
      desc: '',
      args: [],
    );
  }

  /// `Analyze Disease`
  String get analyzeDisease {
    return Intl.message(
      'Analyze Disease',
      name: 'analyzeDisease',
      desc: '',
      args: [],
    );
  }

  /// `Choose Different Image`
  String get chooseDifferentImage {
    return Intl.message(
      'Choose Different Image',
      name: 'chooseDifferentImage',
      desc: '',
      args: [],
    );
  }

  /// `Analysis Failed`
  String get analysisFailed {
    return Intl.message(
      'Analysis Failed',
      name: 'analysisFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to analyze the image. Please try again.`
  String get analysisFailedMessage {
    return Intl.message(
      'Failed to analyze the image. Please try again.',
      name: 'analysisFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Analyze Result`
  String get analyzeResult {
    return Intl.message(
      'Analyze Result',
      name: 'analyzeResult',
      desc: '',
      args: [],
    );
  }

  /// `Image not available`
  String get imageNotAvailable {
    return Intl.message(
      'Image not available',
      name: 'imageNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `Confidence`
  String get confidence {
    return Intl.message('Confidence', name: 'confidence', desc: '', args: []);
  }

  /// `Analysis Details`
  String get analysisDetails {
    return Intl.message(
      'Analysis Details',
      name: 'analysisDetails',
      desc: '',
      args: [],
    );
  }

  /// `No description available.`
  String get noDescriptionAvailable {
    return Intl.message(
      'No description available.',
      name: 'noDescriptionAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Symptoms:`
  String get symptoms {
    return Intl.message('Symptoms:', name: 'symptoms', desc: '', args: []);
  }

  /// `Recommendations`
  String get recommendations {
    return Intl.message(
      'Recommendations',
      name: 'recommendations',
      desc: '',
      args: [],
    );
  }

  /// `No recommendations available.`
  String get noRecommendationsAvailable {
    return Intl.message(
      'No recommendations available.',
      name: 'noRecommendationsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Analyze Another Crop`
  String get analyzeAnotherCrop {
    return Intl.message(
      'Analyze Another Crop',
      name: 'analyzeAnotherCrop',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHome {
    return Intl.message('Back to Home', name: 'backToHome', desc: '', args: []);
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
