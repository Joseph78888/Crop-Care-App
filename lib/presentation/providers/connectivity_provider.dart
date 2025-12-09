import 'dart:async';
import 'dart:io';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider that tracks internet connectivity status
final connectivityProvider = NotifierProvider<ConnectivityNotifier, bool>(
  ConnectivityNotifier.new,
);

/// Notifier that monitors internet connectivity by periodically checking
/// connection to a reliable host
class ConnectivityNotifier extends Notifier<bool> {
  Timer? _timer;
  static const _checkInterval = Duration(seconds: 10);
  static const _checkHost = 'google.com';

  @override
  bool build() {
    // Initial check
    _checkConnectivity();
    // Periodic checks
    _timer = Timer.periodic(_checkInterval, (_) => _checkConnectivity());

    // Cancel timer when provider is disposed
    ref.onDispose(() {
      _timer?.cancel();
    });

    return true; // Assume online initially
  }

  Future<void> _checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup(_checkHost);
      final isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      if (state != isConnected) {
        state = isConnected;
        log('Connectivity changed: ${isConnected ? "online" : "offline"}');
      }
    } on SocketException catch (_) {
      if (state != false) {
        state = false;
        log('Connectivity changed: offline');
      }
    }
  }

  /// Force an immediate connectivity check
  Future<void> checkNow() async {
    await _checkConnectivity();
  }
}
