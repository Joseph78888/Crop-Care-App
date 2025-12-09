import 'package:crop_care_app/presentation/providers/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crop_care_app/generated/l10n.dart';
import '/data/datasources/local/notification_local_data_source.dart';
import '/presentation/providers/locale_provider.dart';
import '/presentation/widgets/about_app.dart';
import '/core/theme/app_colors.dart';
import '/presentation/widgets/settings_section.dart';
import '/presentation/widgets/gradient_scaffold.dart';
import '/main.dart' show firebaseInitialized;

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notificationsEnabled = true; // Default state
  bool darkModeToggle = false;

  @override
  void initState() {
    super.initState();
    _loadSwitchState();
  }

  // Load the initial notification state when the widget is created
  Future<void> _loadSwitchState() async {
    final isEnabled = await loadNotificationPreference();
    setState(() {
      _notificationsEnabled = isEnabled;
    });
  }

  // Handles the switch change event
  void _onSwitchChanged(bool newValue) async {
    // Check if we're offline (Firebase not initialized)
    if (!firebaseInitialized) {
      // Show offline message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).noInternetConnection),
            duration: const Duration(seconds: 2),
          ),
        );
      }
      return; // Don't change the switch
    }

    if (newValue) {
      // User wants to enable notifications - request permission
      final wasEnabled = await enableNotifications();
      setState(() {
        _notificationsEnabled = wasEnabled;
      });

      // Show feedback if permission was denied
      if (!wasEnabled && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              S.of(context).featureComingSoon,
            ), // TODO: Add proper permission denied message
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      // User wants to disable notifications
      await disableNotifications();
      setState(() {
        _notificationsEnabled = false;
      });
    }
  }

  void _clearHistory() {
    showDialog(
      context: context,
      builder: (dialogContext) => Builder(
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).clearHistoryTitle),
            content: Text(S.of(context).clearHistoryMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(S.of(context).cancel),
              ),
              TextButton(
                onPressed: () {
                  ref.read(historyProvider.notifier).clear();
                  _loadPrefs();
                  Navigator.of(dialogContext).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(S.of(context).historyCleared)),
                  );
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: Text(S.of(context).clear),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('analysis_history');
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Builder(
          builder: (context) {
            return Text(
              S.of(context).settings,
              style: const TextStyle(fontWeight: FontWeight.w400),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        // elevation: 0,
      ),

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                /// General Section
                ///
                /// this section is about General it contains Languages, Notifications and Dark Mode
                Builder(
                  builder: (context) {
                    return SettingsSections(
                      icon: Icons.language,
                      title: S.of(context).general,
                      tiles: [
                        ListTile(
                          onTap: _showLanguageDialog,
                          leading: const Icon(Icons.language),
                          title: Text(S.of(context).languages),
                          subtitle: Builder(
                            builder: (context) {
                              final locale = ref.watch(localeProvider);
                              return Text(
                                locale.languageCode == 'ar'
                                    ? S.of(context).arabic
                                    : S.of(context).english,
                              );
                            },
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          leading: const Icon(Icons.notifications),
                          title: Text(S.of(context).notifications),
                          subtitle: Text(
                            _notificationsEnabled ? 'Enabled' : 'Disabled',
                          ),
                          trailing: Switch(
                            value: _notificationsEnabled,
                            onChanged: _onSwitchChanged,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                /// Help & Support Section
                ///
                /// this section is about Help & Support it contains User guid, Contact Support and Rate The App
                const SizedBox(height: 20),
                Builder(
                  builder: (context) {
                    return SettingsSections(
                      icon: Icons.live_help_outlined,
                      title: S.of(context).helpAndSupport,
                      tiles: [
                        ListTile(
                          leading: const Icon(Icons.book),
                          title: Text(S.of(context).userGuide),
                          subtitle: Text(S.of(context).learnHowToUse),
                          onTap: _showHelpDialog,
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          leading: const Icon(Icons.email),
                          title: Text(S.of(context).contactSupport),
                          subtitle: Text(S.of(context).getHelpFromTeam),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).featureComingSoon),
                              ),
                            );
                          },
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          leading: const Icon(Icons.star_rounded),
                          title: Text(S.of(context).rateTheApp),
                          subtitle: Text(S.of(context).shareYourFeedback),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).thankYouRating),
                              ),
                            );
                          },
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    );
                  },
                ),

                /// Data & Privacy Section
                ///
                /// this section is about Data & Privacy it contains User guid, Contact Support and Rate The App
                const SizedBox(height: 20),
                Builder(
                  builder: (context) {
                    return SettingsSections(
                      icon: Icons.privacy_tip_outlined,
                      title: S.of(context).dataAndPrivacy,
                      tiles: [
                        ListTile(
                          onTap: _clearHistory,
                          leading: const Icon(Icons.restore_from_trash_rounded),
                          title: Text(S.of(context).clearHistory),
                          subtitle: Text(S.of(context).removeAllHistory),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).featureComingSoon),
                              ),
                            );
                          },
                          leading: const Icon(Icons.privacy_tip),
                          title: Text(S.of(context).privacyPolicy),
                          subtitle: Text(S.of(context).learnAboutDataUsage),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).featureComingSoon),
                              ),
                            );
                          },
                          leading: const Icon(Icons.menu_book_rounded),
                          title: Text(S.of(context).termsOfService),
                          subtitle: Text(S.of(context).usageTermsAndConditions),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    );
                  },
                ),

                /// About Crop Care Section
                ///
                /// this section is about About Crop Care it contains Summary info about the app and Development Team
                const SizedBox(height: 20),
                Builder(
                  builder: (context) {
                    return Row(
                      children: [
                        const Icon(
                          color: AppColors.primary,
                          Icons.shield_outlined,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          S.of(context).aboutCropCare, // section title
                          style: const TextStyle(
                            color: Color.fromARGB(
                              191,
                              65,
                              65,
                              65,
                            ), // section title color
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),

                /// About App Section
                ///
                /// this is the last section in the settings screen .
                /// this section had additon elements, soo I make a new widget called [AboutApp()]
                /// contains the addition elements and configuration the needs.
                const AboutApp(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => Builder(
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).selectLanguage),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLanguageOption(S.of(context).english),
                _buildLanguageOption(S.of(context).arabic),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(S.of(context).cancel),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    final locale = ref.watch(localeProvider);
    final currentLanguage = locale.languageCode == 'ar'
        ? S.of(context).arabic
        : S.of(context).english;

    return RadioListTile<String>(
      title: Text(language),
      value: language,
      groupValue: currentLanguage,
      onChanged: (value) async {
        // Determine locale code based on selected language
        final localeCode = value == S.of(context).english ? 'en' : 'ar';

        // Update the locale provider
        await ref.read(localeProvider.notifier).setLocale(Locale(localeCode));

        // Close the dialog
        if (mounted) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => Builder(
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).helpDialogTitle),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).howToUseCropCare,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(S.of(context).step1),
                  Text(S.of(context).step2),
                  Text(S.of(context).step3),
                  Text(S.of(context).step4),
                  Text(S.of(context).step5),
                  const SizedBox(height: 12),
                  Text(
                    S.of(context).tipsForBetterResults,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(S.of(context).tip1),
                  Text(S.of(context).tip2),
                  Text(S.of(context).tip3),
                  Text(S.of(context).tip4),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(S.of(context).gotIt),
              ),
            ],
          );
        },
      ),
    );
  }
}
