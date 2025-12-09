import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/main.dart' show firebaseInitialized;

// --- Configuration ---
const String _kTopicName = 'global_notifications';
const String _kPrefsKey = 'notifications_enabled';
const String _kFirstLaunchKey = 'notification_permission_requested';
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

Future<void> _unsubscribeFromTopic() async {
  try {
    await FirebaseMessaging.instance.unsubscribeFromTopic(_kTopicName);
    log('FCM: Unsubscribed from $_kTopicName');
  } catch (e) {
    log('FCM Error: Failed to unsubscribe from topic: $e');
  }
}

/// Initialize notifications on app startup.
/// Requests permission on FIRST app launch, then syncs subscription state.
Future<void> initializeNotifications() async {
  final prefs = await SharedPreferences.getInstance();
  final hasRequestedPermission = prefs.getBool(_kFirstLaunchKey) ?? false;

  if (!hasRequestedPermission) {
    // First app launch - request permission
    log('FCM: First launch detected, requesting notification permission...');

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Mark that we've requested permission
    await prefs.setBool(_kFirstLaunchKey, true);

    // Set preference based on permission result
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      // Permission granted - enable notifications
      await prefs.setBool(_kPrefsKey, true);
      await _subscribeToTopic();
      log('FCM: Permission granted on first launch, notifications enabled');
    } else {
      // Permission denied - disable notifications
      await prefs.setBool(_kPrefsKey, false);
      log('FCM: Permission denied on first launch, notifications disabled');
    }
  } else {
    // Subsequent launches - sync subscription with stored preference
    await _syncNotificationSubscription();
  }
}

/// Syncs FCM subscription state with stored preference.
/// Called on subsequent app launches (not first launch).
Future<void> _syncNotificationSubscription() async {
  final prefs = await SharedPreferences.getInstance();
  final isEnabled = prefs.getBool(_kPrefsKey) ?? false;

  if (isEnabled) {
    await _subscribeToTopic();
  } else {
    await _unsubscribeFromTopic();
  }

  log('FCM: Synced notification subscription, enabled: $isEnabled');
}

/// Subscribes the device to the FCM topic and updates local preference.
/// Handles setting the notifications ON, including requesting OS permission.
/// Returns true if notifications were successfully enabled.
Future<bool> enableNotifications() async {
  // Check if Firebase is available (may not be if offline)
  if (!firebaseInitialized) {
    log(
      'FCM: Cannot enable notifications - Firebase not initialized (offline?)',
    );
    return false;
  }

  // 1. Check/Request OS-level permission first (Crucial for iOS/Android 13+)
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  final prefs = await SharedPreferences.getInstance();

  // 2. Determine if permission was granted
  if (settings.authorizationStatus == AuthorizationStatus.authorized ||
      settings.authorizationStatus == AuthorizationStatus.provisional) {
    // Permission granted, now subscribe to the topic
    await _subscribeToTopic();
    await prefs.setBool(_kPrefsKey, true);
    log('FCM: Notifications enabled successfully');
    return true;
  } else {
    // Permission denied or not determined
    // IMPORTANT: If permission is denied, switch should reflect this,
    // even if the user tried to turn it "ON".
    await prefs.setBool(_kPrefsKey, false);
    log('FCM: Notification permission denied');
    return false;
  }
}

/// Unsubscribes the device from the FCM topic and updates local preference.
Future<void> disableNotifications() async {
  // Check if Firebase is available (may not be if offline)
  if (!firebaseInitialized) {
    log(
      'FCM: Cannot disable notifications - Firebase not initialized (offline?)',
    );
    // Still save preference locally so it takes effect when online
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kPrefsKey, false);
    return;
  }

  try {
    // 1. Unsubscribe the device from the topic
    await _unsubscribeFromTopic();

    // 2. Store the preference locally
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kPrefsKey, false);
  } catch (e) {
    log('FCM Error: Failed to disable notifications: $e');
  }
}

/// Loads the stored notification preference.
/// Returns the current state (true/false).
/// Note: This does NOT subscribe/unsubscribe - use initializeNotifications() for that.
Future<bool> loadNotificationPreference() async {
  final prefs = await SharedPreferences.getInstance();
  // Default to false if no preference is found (will be set by initializeNotifications)
  final isEnabled = prefs.getBool(_kPrefsKey) ?? false;
  log('FCM: Loaded notification preference: $isEnabled');
  return isEnabled;
}
