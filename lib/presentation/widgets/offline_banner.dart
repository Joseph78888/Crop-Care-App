import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/providers/connectivity_provider.dart';
import '/generated/l10n.dart';

/// A banner widget that displays briefly when the device goes offline.
/// Shows for a few seconds then auto-dismisses to avoid UX clutter.
class OfflineBanner extends ConsumerStatefulWidget {
  const OfflineBanner({super.key});

  /// Duration to show the banner before auto-dismissing
  static const Duration showDuration = Duration(seconds: 4);

  /// Animation duration for slide in/out
  static const Duration animationDuration = Duration(milliseconds: 300);

  @override
  ConsumerState<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends ConsumerState<OfflineBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _wasOnline = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: OfflineBanner.animationDuration,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showBannerBriefly() {
    // Slide in
    _animationController.forward();

    // Auto-dismiss after duration
    Future.delayed(OfflineBanner.showDuration, () {
      if (mounted) {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isOnline = ref.watch(connectivityProvider);

    // Detect transition from online to offline
    if (_wasOnline && !isOnline) {
      // Schedule after frame to avoid setState during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showBannerBriefly();
      });
    }
    _wasOnline = isOnline;

    // Use SizeTransition to properly collapse the space when hidden
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: -1.0, // Align to top
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.orange.shade700,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              const Icon(Icons.wifi_off_rounded, color: Colors.white, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  S.of(context).noInternetConnection,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
