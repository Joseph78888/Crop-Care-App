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

  /// `Assistance`
  String get chatbot {
    return Intl.message('Assistance', name: 'chatbot', desc: '', args: []);
  }

  /// `AI Assistance`
  String get chatbotAppBar {
    return Intl.message(
      'AI Assistance',
      name: 'chatbotAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Ask about crops...`
  String get chatbotTextFieldHint {
    return Intl.message(
      'Ask about crops...',
      name: 'chatbotTextFieldHint',
      desc: '',
      args: [],
    );
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

  /// `Welcome`
  String get onboardingWelcome {
    return Intl.message(
      'Welcome',
      name: 'onboardingWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Scan plants, spot issues, and get instant care tips.`
  String get onboardingSubtitle {
    return Intl.message(
      'Scan plants, spot issues, and get instant care tips.',
      name: 'onboardingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get onboardingGetStarted {
    return Intl.message(
      'Get Started',
      name: 'onboardingGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection - some features may be unavailable.`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection - some features may be unavailable.',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Ask me anything about your crops!`
  String get askMeAnything {
    return Intl.message(
      'Ask me anything about your crops!',
      name: 'askMeAnything',
      desc: '',
      args: [],
    );
  }

  /// `Bacterial Spot`
  String get disease_Bacterial_spot_name {
    return Intl.message(
      'Bacterial Spot',
      name: 'disease_Bacterial_spot_name',
      desc: '',
      args: [],
    );
  }

  /// `Bacterial spot is caused by Xanthomonas bacteria. It affects leaves, stems, and fruit, causing dark spots and lesions that reduce yield and fruit quality.`
  String get disease_Bacterial_spot_description {
    return Intl.message(
      'Bacterial spot is caused by Xanthomonas bacteria. It affects leaves, stems, and fruit, causing dark spots and lesions that reduce yield and fruit quality.',
      name: 'disease_Bacterial_spot_description',
      desc: '',
      args: [],
    );
  }

  /// `Small dark brown to black spots on leaves\nYellow halos around spots\nLeaf drop in severe cases\nRaised, scab-like lesions on fruit`
  String get disease_Bacterial_spot_symptoms {
    return Intl.message(
      'Small dark brown to black spots on leaves\nYellow halos around spots\nLeaf drop in severe cases\nRaised, scab-like lesions on fruit',
      name: 'disease_Bacterial_spot_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Remove and destroy infected plant parts\nApply copper-based bactericides\nAvoid overhead watering\nEnsure good air circulation\nUse disease-free seeds and transplants`
  String get disease_Bacterial_spot_recommendations {
    return Intl.message(
      'Remove and destroy infected plant parts\nApply copper-based bactericides\nAvoid overhead watering\nEnsure good air circulation\nUse disease-free seeds and transplants',
      name: 'disease_Bacterial_spot_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Early Blight`
  String get disease_Early_blight_name {
    return Intl.message(
      'Early Blight',
      name: 'disease_Early_blight_name',
      desc: '',
      args: [],
    );
  }

  /// `Early blight is caused by the fungus Alternaria solani. It typically affects older, lower leaves first and can cause significant defoliation and reduced fruit quality.`
  String get disease_Early_blight_description {
    return Intl.message(
      'Early blight is caused by the fungus Alternaria solani. It typically affects older, lower leaves first and can cause significant defoliation and reduced fruit quality.',
      name: 'disease_Early_blight_description',
      desc: '',
      args: [],
    );
  }

  /// `Dark brown spots with concentric rings (target pattern)\nYellowing tissue around spots\nStarts on lower leaves and moves upward\nPremature leaf drop`
  String get disease_Early_blight_symptoms {
    return Intl.message(
      'Dark brown spots with concentric rings (target pattern)\nYellowing tissue around spots\nStarts on lower leaves and moves upward\nPremature leaf drop',
      name: 'disease_Early_blight_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Remove affected leaves immediately\nApply fungicide spray regularly\nImprove air circulation by spacing plants\nMulch around plants to prevent soil splash\nRotate crops every 2-3 years`
  String get disease_Early_blight_recommendations {
    return Intl.message(
      'Remove affected leaves immediately\nApply fungicide spray regularly\nImprove air circulation by spacing plants\nMulch around plants to prevent soil splash\nRotate crops every 2-3 years',
      name: 'disease_Early_blight_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Late Blight`
  String get disease_Late_blight_name {
    return Intl.message(
      'Late Blight',
      name: 'disease_Late_blight_name',
      desc: '',
      args: [],
    );
  }

  /// `Late blight is caused by the oomycete Phytophthora infestans. It spreads rapidly in cool, wet weather and can devastate an entire crop within days.`
  String get disease_Late_blight_description {
    return Intl.message(
      'Late blight is caused by the oomycete Phytophthora infestans. It spreads rapidly in cool, wet weather and can devastate an entire crop within days.',
      name: 'disease_Late_blight_description',
      desc: '',
      args: [],
    );
  }

  /// `Large, irregular water-soaked patches on leaves\nWhite fuzzy growth on the underside of leaves\nDark brown blotches on stems\nRapid plant collapse in humid conditions`
  String get disease_Late_blight_symptoms {
    return Intl.message(
      'Large, irregular water-soaked patches on leaves\nWhite fuzzy growth on the underside of leaves\nDark brown blotches on stems\nRapid plant collapse in humid conditions',
      name: 'disease_Late_blight_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Remove and destroy all infected plants immediately\nApply preventive fungicides before wet weather\nDo not compost infected material\nAvoid overhead irrigation\nPlant resistant varieties when possible`
  String get disease_Late_blight_recommendations {
    return Intl.message(
      'Remove and destroy all infected plants immediately\nApply preventive fungicides before wet weather\nDo not compost infected material\nAvoid overhead irrigation\nPlant resistant varieties when possible',
      name: 'disease_Late_blight_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Leaf Mold`
  String get disease_Leaf_Mold_name {
    return Intl.message(
      'Leaf Mold',
      name: 'disease_Leaf_Mold_name',
      desc: '',
      args: [],
    );
  }

  /// `Leaf mold is caused by the fungus Passalora fulva (Cladosporium fulvum). It thrives in warm, humid greenhouse conditions and can reduce photosynthesis.`
  String get disease_Leaf_Mold_description {
    return Intl.message(
      'Leaf mold is caused by the fungus Passalora fulva (Cladosporium fulvum). It thrives in warm, humid greenhouse conditions and can reduce photosynthesis.',
      name: 'disease_Leaf_Mold_description',
      desc: '',
      args: [],
    );
  }

  /// `Pale green to yellow spots on upper leaf surfaces\nOlive-green to grayish-purple fuzzy growth on undersides\nLeaves curl, wither, and drop prematurely\nMost common in high-humidity environments`
  String get disease_Leaf_Mold_symptoms {
    return Intl.message(
      'Pale green to yellow spots on upper leaf surfaces\nOlive-green to grayish-purple fuzzy growth on undersides\nLeaves curl, wither, and drop prematurely\nMost common in high-humidity environments',
      name: 'disease_Leaf_Mold_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Increase ventilation in greenhouses\nReduce humidity below 85%\nRemove infected leaves promptly\nApply fungicides if the outbreak is severe\nUse resistant tomato varieties`
  String get disease_Leaf_Mold_recommendations {
    return Intl.message(
      'Increase ventilation in greenhouses\nReduce humidity below 85%\nRemove infected leaves promptly\nApply fungicides if the outbreak is severe\nUse resistant tomato varieties',
      name: 'disease_Leaf_Mold_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Septoria Leaf Spot`
  String get disease_Septoria_leaf_spot_name {
    return Intl.message(
      'Septoria Leaf Spot',
      name: 'disease_Septoria_leaf_spot_name',
      desc: '',
      args: [],
    );
  }

  /// `Septoria leaf spot is caused by the fungus Septoria lycopersici. It typically appears after fruit set and can cause extensive defoliation.`
  String get disease_Septoria_leaf_spot_description {
    return Intl.message(
      'Septoria leaf spot is caused by the fungus Septoria lycopersici. It typically appears after fruit set and can cause extensive defoliation.',
      name: 'disease_Septoria_leaf_spot_description',
      desc: '',
      args: [],
    );
  }

  /// `Small circular spots with dark brown borders\nGray or tan centers with tiny black dots (pycnidia)\nStarts on lower leaves and moves upward\nSevere defoliation if untreated`
  String get disease_Septoria_leaf_spot_symptoms {
    return Intl.message(
      'Small circular spots with dark brown borders\nGray or tan centers with tiny black dots (pycnidia)\nStarts on lower leaves and moves upward\nSevere defoliation if untreated',
      name: 'disease_Septoria_leaf_spot_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Remove and destroy infected leaves\nApply fungicide treatments regularly\nMulch around plants to prevent soil splash\nAvoid overhead watering\nStake or cage plants for better airflow`
  String get disease_Septoria_leaf_spot_recommendations {
    return Intl.message(
      'Remove and destroy infected leaves\nApply fungicide treatments regularly\nMulch around plants to prevent soil splash\nAvoid overhead watering\nStake or cage plants for better airflow',
      name: 'disease_Septoria_leaf_spot_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Target Spot`
  String get disease_Target_Spot_name {
    return Intl.message(
      'Target Spot',
      name: 'disease_Target_Spot_name',
      desc: '',
      args: [],
    );
  }

  /// `Target spot is caused by the fungus Corynespora cassiicola. It affects leaves, stems, and fruit, causing circular lesions with concentric rings.`
  String get disease_Target_Spot_description {
    return Intl.message(
      'Target spot is caused by the fungus Corynespora cassiicola. It affects leaves, stems, and fruit, causing circular lesions with concentric rings.',
      name: 'disease_Target_Spot_description',
      desc: '',
      args: [],
    );
  }

  /// `Small brown spots that enlarge into target-like rings\nLesions may merge, causing large necrotic areas\nPremature defoliation of lower canopy\nFruit lesions with sunken, dark spots`
  String get disease_Target_Spot_symptoms {
    return Intl.message(
      'Small brown spots that enlarge into target-like rings\nLesions may merge, causing large necrotic areas\nPremature defoliation of lower canopy\nFruit lesions with sunken, dark spots',
      name: 'disease_Target_Spot_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Remove and destroy infected plant debris\nApply appropriate fungicides preventively\nImprove air circulation between plants\nPractice crop rotation with non-solanaceous crops\nAvoid excessive nitrogen fertilisation`
  String get disease_Target_Spot_recommendations {
    return Intl.message(
      'Remove and destroy infected plant debris\nApply appropriate fungicides preventively\nImprove air circulation between plants\nPractice crop rotation with non-solanaceous crops\nAvoid excessive nitrogen fertilisation',
      name: 'disease_Target_Spot_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Spider Mites (Two-Spotted)`
  String get disease_Spider_mites_name {
    return Intl.message(
      'Spider Mites (Two-Spotted)',
      name: 'disease_Spider_mites_name',
      desc: '',
      args: [],
    );
  }

  /// `Two-spotted spider mites (Tetranychus urticae) are tiny arachnids that feed on plant sap, causing stippling, yellowing, and reduced vigour. They thrive in hot, dry conditions.`
  String get disease_Spider_mites_description {
    return Intl.message(
      'Two-spotted spider mites (Tetranychus urticae) are tiny arachnids that feed on plant sap, causing stippling, yellowing, and reduced vigour. They thrive in hot, dry conditions.',
      name: 'disease_Spider_mites_description',
      desc: '',
      args: [],
    );
  }

  /// `Tiny yellow or white stippling on leaves\nFine silken webbing on leaf undersides\nLeaves turn bronze or yellow and become brittle\nSevere infestations cause leaf drop and plant stress`
  String get disease_Spider_mites_symptoms {
    return Intl.message(
      'Tiny yellow or white stippling on leaves\nFine silken webbing on leaf undersides\nLeaves turn bronze or yellow and become brittle\nSevere infestations cause leaf drop and plant stress',
      name: 'disease_Spider_mites_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Spray plants with a strong jet of water\nApply insecticidal soap or neem oil\nIncrease ambient humidity around plants\nRemove heavily infested leaves and destroy them\nIntroduce beneficial predatory mites`
  String get disease_Spider_mites_recommendations {
    return Intl.message(
      'Spray plants with a strong jet of water\nApply insecticidal soap or neem oil\nIncrease ambient humidity around plants\nRemove heavily infested leaves and destroy them\nIntroduce beneficial predatory mites',
      name: 'disease_Spider_mites_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Yellow Leaf Curl Virus`
  String get disease_Yellow_Leaf_Curl_Virus_name {
    return Intl.message(
      'Yellow Leaf Curl Virus',
      name: 'disease_Yellow_Leaf_Curl_Virus_name',
      desc: '',
      args: [],
    );
  }

  /// `Tomato Yellow Leaf Curl Virus (TYLCV) is transmitted by whiteflies (Bemisia tabaci). It causes severe stunting, leaf curling, and dramatic yield loss.`
  String get disease_Yellow_Leaf_Curl_Virus_description {
    return Intl.message(
      'Tomato Yellow Leaf Curl Virus (TYLCV) is transmitted by whiteflies (Bemisia tabaci). It causes severe stunting, leaf curling, and dramatic yield loss.',
      name: 'disease_Yellow_Leaf_Curl_Virus_description',
      desc: '',
      args: [],
    );
  }

  /// `Upward curling of leaf margins\nYellowing (chlorosis) between leaf veins\nSeverely stunted plant growth\nSmall, distorted, cupped leaves`
  String get disease_Yellow_Leaf_Curl_Virus_symptoms {
    return Intl.message(
      'Upward curling of leaf margins\nYellowing (chlorosis) between leaf veins\nSeverely stunted plant growth\nSmall, distorted, cupped leaves',
      name: 'disease_Yellow_Leaf_Curl_Virus_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Control whitefly populations with yellow sticky traps\nApply appropriate insecticides against whiteflies\nRemove and destroy infected plants early\nUse TYLCV-resistant tomato varieties\nUse reflective mulches to deter whiteflies`
  String get disease_Yellow_Leaf_Curl_Virus_recommendations {
    return Intl.message(
      'Control whitefly populations with yellow sticky traps\nApply appropriate insecticides against whiteflies\nRemove and destroy infected plants early\nUse TYLCV-resistant tomato varieties\nUse reflective mulches to deter whiteflies',
      name: 'disease_Yellow_Leaf_Curl_Virus_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Tomato Mosaic Virus`
  String get disease_Tomato_mosaic_virus_name {
    return Intl.message(
      'Tomato Mosaic Virus',
      name: 'disease_Tomato_mosaic_virus_name',
      desc: '',
      args: [],
    );
  }

  /// `Tomato Mosaic Virus (ToMV) is a highly stable virus spread through contaminated tools, hands, and seeds. It causes mottled leaves and can persist in soil debris for years.`
  String get disease_Tomato_mosaic_virus_description {
    return Intl.message(
      'Tomato Mosaic Virus (ToMV) is a highly stable virus spread through contaminated tools, hands, and seeds. It causes mottled leaves and can persist in soil debris for years.',
      name: 'disease_Tomato_mosaic_virus_description',
      desc: '',
      args: [],
    );
  }

  /// `Light and dark green mosaic patterns on leaves\nLeaf curling and distortion\nStunted plant growth\nReduced and uneven fruit ripening`
  String get disease_Tomato_mosaic_virus_symptoms {
    return Intl.message(
      'Light and dark green mosaic patterns on leaves\nLeaf curling and distortion\nStunted plant growth\nReduced and uneven fruit ripening',
      name: 'disease_Tomato_mosaic_virus_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Remove and destroy infected plants immediately\nDisinfect tools and hands with milk or bleach solution\nUse certified virus-free seeds and transplants\nAvoid tobacco use near plants (cross-contamination)\nPlant ToMV-resistant varieties`
  String get disease_Tomato_mosaic_virus_recommendations {
    return Intl.message(
      'Remove and destroy infected plants immediately\nDisinfect tools and hands with milk or bleach solution\nUse certified virus-free seeds and transplants\nAvoid tobacco use near plants (cross-contamination)\nPlant ToMV-resistant varieties',
      name: 'disease_Tomato_mosaic_virus_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Healthy Tomato`
  String get disease_healthy_name {
    return Intl.message(
      'Healthy Tomato',
      name: 'disease_healthy_name',
      desc: '',
      args: [],
    );
  }

  /// `Your tomato plant appears healthy with no visible signs of disease or pest damage. Continue with regular care and monitoring to maintain plant health.`
  String get disease_healthy_description {
    return Intl.message(
      'Your tomato plant appears healthy with no visible signs of disease or pest damage. Continue with regular care and monitoring to maintain plant health.',
      name: 'disease_healthy_description',
      desc: '',
      args: [],
    );
  }

  /// `Vibrant green leaves with no spots\nStrong, upright stem growth\nNo discoloration or wilting\nNormal fruit development`
  String get disease_healthy_symptoms {
    return Intl.message(
      'Vibrant green leaves with no spots\nStrong, upright stem growth\nNo discoloration or wilting\nNormal fruit development',
      name: 'disease_healthy_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Continue regular watering schedule\nMaintain balanced fertilisation\nMonitor plants weekly for early signs of trouble\nEnsure good air circulation between plants\nPractice crop rotation each season`
  String get disease_healthy_recommendations {
    return Intl.message(
      'Continue regular watering schedule\nMaintain balanced fertilisation\nMonitor plants weekly for early signs of trouble\nEnsure good air circulation between plants\nPractice crop rotation each season',
      name: 'disease_healthy_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Condition`
  String get disease_Unknown_name {
    return Intl.message(
      'Unknown Condition',
      name: 'disease_Unknown_name',
      desc: '',
      args: [],
    );
  }

  /// `The model could not confidently identify a specific disease. Please ensure the image is clear, well-lit, and contains a tomato plant leaf.`
  String get disease_Unknown_description {
    return Intl.message(
      'The model could not confidently identify a specific disease. Please ensure the image is clear, well-lit, and contains a tomato plant leaf.',
      name: 'disease_Unknown_description',
      desc: '',
      args: [],
    );
  }

  /// `Unclear or blurry image\nImage may not contain a tomato leaf\nLow-confidence prediction from the model`
  String get disease_Unknown_symptoms {
    return Intl.message(
      'Unclear or blurry image\nImage may not contain a tomato leaf\nLow-confidence prediction from the model',
      name: 'disease_Unknown_symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Take a clearer, well-lit photo\nEnsure the leaf fills most of the frame\nAvoid shadows and glare on the leaf surface\nConsult an agricultural expert if symptoms persist`
  String get disease_Unknown_recommendations {
    return Intl.message(
      'Take a clearer, well-lit photo\nEnsure the leaf fills most of the frame\nAvoid shadows and glare on the leaf surface\nConsult an agricultural expert if symptoms persist',
      name: 'disease_Unknown_recommendations',
      desc: '',
      args: [],
    );
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
