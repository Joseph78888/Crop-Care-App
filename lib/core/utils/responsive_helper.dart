import 'package:flutter/material.dart';

/// Responsive design helper using MediaQuery
/// Provides methods for responsive sizing, spacing, and typography
class ResponsiveHelper {
  final BuildContext context;

  ResponsiveHelper(this.context);

  // Get screen dimensions
  Size get screenSize => MediaQuery.of(context).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  // Design base (standard mobile design width)
  static const double _designWidth = 375.0;
  static const double _designHeight = 812.0;

  /// Responsive width - percentage of screen width
  /// Example: wp(50) = 50% of screen width
  double wp(double percentage) => screenWidth * (percentage / 100);

  /// Responsive height - percentage of screen height
  /// Example: hp(10) = 10% of screen height
  double hp(double percentage) => screenHeight * (percentage / 100);

  /// Responsive font size - scales with screen width
  /// Example: sp(16) scales 16px based on screen
  double sp(double size) => size * (screenWidth / _designWidth);

  /// Responsive size - scales proportionally
  /// Use for heights, widths, padding, etc.
  /// Example: rs(120) scales 120px proportionally
  double rs(double size) => size * (screenWidth / _designWidth);

  // Spacing constants (commonly used spacings)
  double get xs => rs(4); // Extra small: 4dp
  double get sm => rs(8); // Small: 8dp
  double get md => rs(16); // Medium: 16dp (standard)
  double get lg => rs(24); // Large: 24dp
  double get xl => rs(32); // Extra large: 32dp
  double get xxl => rs(48); // Extra extra large: 48dp
  double get xxxl => rs(64); // Extra extra extra large: 64dp

  // Typography scale
  double get textXS => sp(12); // Extra small text
  double get textSM => sp(14); // Small text
  double get textMD => sp(16); // Medium/body text
  double get textLG => sp(18); // Large text
  double get textXL => sp(20); // Extra large text
  double get textXXL => sp(24); // Headers

  // Screen size breakpoints
  bool get isSmallScreen => screenWidth < 360;
  bool get isMediumScreen => screenWidth >= 360 && screenWidth < 400;
  bool get isLargeScreen => screenWidth >= 400 && screenWidth < 480;
  bool get isTablet => screenWidth >= 480;
}

/// Extension for easy access throughout the app
/// Usage: context.responsive.textLG
extension ResponsiveExtension on BuildContext {
  ResponsiveHelper get responsive => ResponsiveHelper(this);
}
