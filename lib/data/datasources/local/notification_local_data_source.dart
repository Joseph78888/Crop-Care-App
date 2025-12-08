import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --- Configuration ---
const String _kTopicName = 'global_notifications';
const String _kPrefsKey = 'notifications_enabled';
// ---------------------

// Define the core subscription logic in a separate helper function
Future<void> _subscribeToTopic() async {
  try {
    await FirebaseMessaging.instance.subscribeToTopic(_kTopicName);
    log('FCM: Subscribed to global_notifications');
  } catch (e) {
    log('FCM Error: Failed to subscribe to topic: $e');
  }
}

/// Subscribes the device to the FCM topic and updates local preference.
/// Handles setting the notifications ON, including requesting OS permission.
Future<void> enableNotifications() async {
  // 1. Check/Request OS-level permission first (Crucial for iOS/Android 13+)
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true, badge: true, sound: true,
  );

  final prefs = await SharedPreferences.getInstance();
  
  // 2. Determine if permission was granted
  if (settings.authorizationStatus == AuthorizationStatus.authorized || 
      settings.authorizationStatus == AuthorizationStatus.provisional) {
    
    // Permission granted, now subscribe to the topic
    await _subscribeToTopic();
    await prefs.setBool('notifications_enabled', true);
    
  } else {
    // Permission denied or not determined (on first run/tap)
    // IMPORTANT: If permission is denied, switch should reflect this, 
    // even if the user tried to turn it "ON".
    await prefs.setBool('notifications_enabled', false);
    
    // Optionally, show a SnackBar or Dialog explaining they need to 
    // enable it in OS settings manually.
  }
}

/// Unsubscribes the device from the FCM topic and updates local preference.
Future<void> disableNotifications() async {
  try {
    // 1. Unsubscribe the device from the topic
    await FirebaseMessaging.instance.unsubscribeFromTopic(_kTopicName);

    // 2. Store the preference locally
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kPrefsKey, false);
    
    log('FCM: Unsubscribed from $_kTopicName');
  } catch (e) {
    log('FCM Error: Failed to unsubscribe from topic: $e');
  }
}

/// Loads the stored preference and ensures the FCM subscription state matches.
/// Returns the current state (true/false).
Future<bool> loadNotificationPreference() async {
  final prefs = await SharedPreferences.getInstance();
  // Default to true if no preference is found (Opt-in by default)
  final isEnabled = prefs.getBool(_kPrefsKey) ?? true; 

  if (isEnabled) {
      await FirebaseMessaging.instance.subscribeToTopic(_kTopicName);
  } else {
      // It's important to call unsubscribe here in case the user reinstalled
      // the app and the local pref was reset, but the FCM subscription was maintained.
      await FirebaseMessaging.instance.unsubscribeFromTopic(_kTopicName);
  }

  log('FCM: Initial notification preference loaded: $isEnabled');
  return isEnabled;
}