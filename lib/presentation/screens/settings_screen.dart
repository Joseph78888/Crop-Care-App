import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/data/datasources/local/notification_local_data_source.dart';
import '/presentation/widgets/about_app.dart';
import '/core/theme/app_colors.dart';
import '/presentation/widgets/settings_section.dart';
import '/presentation/widgets/gradient_scaffold.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true; // Default state
  bool _isLoading = true;
  bool darkModeToggle = false;
  String _selectedLanguage = 'English';

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
      _isLoading = false;
    });
  }

  // Handles the switch change event
  void _onSwitchChanged(bool newValue) async {
    setState(() {
      _notificationsEnabled = newValue;
    });

    if (newValue) {
      await enableNotifications(); // Call the subscribe function
    } else {
      await disableNotifications(); // Call the unsubscribe function
    }
  }

  void _clearHistory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear History'),
        content: const Text(
          'Are you sure you want to clear all analysis history? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _loadPrefs();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('History cleared successfully')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear'),
          ),
        ],
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
        title: Text('Settings', style: TextStyle(fontWeight: FontWeight.w400)),
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
                SettingsSections(
                  icon: Icons.language,
                  title: 'General',
                  tiles: [
                    ListTile(
                      onTap: _showLanguageDialog,
                      leading: Icon(Icons.language),
                      title: Text('Languages'),
                      subtitle: Text('English'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
                      subtitle: Text('English'),
                      trailing: Switch(
                        value: _notificationsEnabled,

                        onChanged: _onSwitchChanged,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.dark_mode),
                      title: Text('Dark Mode'),
                      subtitle: Text('Light'),
                      trailing: Switch(
                        value: darkModeToggle,
                        onChanged: (newValue) {
                          setState(() {
                            darkModeToggle =
                                newValue; // TODO state managment with reverpod
                          });
                        },
                      ),
                    ),
                  ],
                ),

                /// Help & Support Section
                ///
                /// this section is about Help & Support it contains User guid, Contact Support and Rate The App
                const SizedBox(height: 20),
                SettingsSections(
                  icon: Icons.live_help_outlined,
                  title: 'Help & Support',
                  tiles: [
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('User Guid'),
                      subtitle: Text('Learn how to use crop care'),
                      onTap: _showHelpDialog,
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Contact Support'),
                      subtitle: Text('Get help from our team'),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('feature coming soon.')),
                        );
                      },
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: Icon(Icons.star_rounded),
                      title: Text('Rate The App'),
                      subtitle: Text('Share your feedback'),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Thank you for your interest! Rating feature coming soon.',
                            ),
                          ),
                        );
                      },
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),

                /// Data & Privacy Section
                ///
                /// this section is about Data & Privacy it contains User guid, Contact Support and Rate The App
                const SizedBox(height: 20),
                SettingsSections(
                  icon: Icons.privacy_tip_outlined,
                  title: 'data & Privacy',
                  tiles: [
                    ListTile(
                      onTap: _clearHistory,
                      leading: Icon(Icons.restore_from_trash_rounded),
                      title: Text('Clear History'),
                      subtitle: Text('Remove all analysis history'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('feature coming soon.')),
                        );
                      },
                      leading: Icon(Icons.privacy_tip),
                      title: Text('Privacy Policy'),
                      subtitle: Text('Learn about data usage'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('feature coming soon.')),
                        );
                      },
                      leading: Icon(Icons.menu_book_rounded),
                      title: Text('Terms Of Service'),
                      subtitle: Text('Usage terms and conditions'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),

                /// About Crop Care Section
                ///
                /// this section is about About Crop Care it contains Summary info about the app and Development Team
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      color: AppColors.primary,
                      Icons.shield_outlined,
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'About Crop Care', // section title
                      style: TextStyle(
                        color: const Color.fromARGB(
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
                ),
                const SizedBox(height: 16),

                /// About App Section
                ///
                /// this is the last section in the settings screen .
                /// this section had additon elements, soo I make a new widget called [AboutApp()]
                /// contains the addition elements and configuration the needs.
                AboutApp(),
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
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageOption('English'),
            _buildLanguageOption('العربية'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    return RadioListTile<String>(
      title: Text(language),
      value: language,
      groupValue: _selectedLanguage,
      onChanged: (value) {
        setState(() {
          _selectedLanguage = value!;
        });
        //_saveSettings();
        Navigator.of(context).pop();
      },
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Help & Support'),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How to use Crop Care:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('1. Capture or upload a clear image of the crop leaf'),
              Text('2. Wait for AI analysis to complete'),
              Text('3. Review the disease identification results'),
              Text('4. Follow the recommended treatment steps'),
              Text('5. Check your history for past analyses'),
              SizedBox(height: 12),
              Text(
                'Tips for better results:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Use good lighting conditions'),
              Text('• Fill the frame with the leaf'),
              Text('• Avoid blurry or dark images'),
              Text('• Focus on affected areas'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}
