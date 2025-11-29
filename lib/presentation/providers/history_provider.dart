// File: lib/presentation/providers/history_provider.dart
//
// Riverpod providers and data models to manage detection results (current result + history).
// Optional persistence using shared_preferences is included — add the dependency if you want storage:
//
//   shared_preferences: ^2.0.0
//
// This file exposes:
// - DetectionResult model (toJson/fromJson)
// - HealthStatus enum
// - currentResultProvider (StateProvider<DetectionResult?>) -- used by the result screen while processing/displaying
// - historyProvider (StateNotifierProvider) -- manages a list of past DetectionResult entries with add/remove/clear/load/save

import 'package:flutter_riverpod/legacy.dart';
import '../../data/models/detection_result.dart';
import '../../data/repositories/history_repository.dart';

/// Holds current in-memory result while user is on the result screen.
/// Set to a DetectionResult when a prediction returns, clear when user leaves if needed.
final currentResultProvider = StateProvider<DetectionResult?>((ref) => null);

/// History notifier that keeps a list of DetectionResult and persists it to SharedPreferences.
class HistoryNotifier extends StateNotifier<List<DetectionResult>> {
  final HistoryRepository _repo;

  HistoryNotifier(this._repo, [List<DetectionResult>? initial]) : super(initial ?? []) {
    // attempt to load persisted history on construction
    _init();
  }

  Future<void> _init() async {
    final items = await _repo.load();
    state = items;
  }

  /// Adds a result to history (at the front). Optionally save after adding.
  Future<void> addResult(DetectionResult result, {bool persist = true}) async {
    state = [result, ...state];
    if (persist) await _repo.save(state);
  }

  /// Convenience: create result from raw fields and add.
  Future<void> add({
    required String imagePath,
    required String diseaseName,
    required HealthStatus status,
    double? confidence,
    bool persist = true,
  }) async {
    final r = DetectionResult(
      imagePath: imagePath,
      diseaseName: diseaseName,
      status: status,
      confidence: confidence,
    );
    await addResult(r, persist: persist);
  }

  /// Remove a result by id.
  Future<void> removeById(String id, {bool persist = true}) async {
    state = state.where((r) => r.id != id).toList();
    if (persist) await _repo.save(state);
  }

  /// Clear history.
  Future<void> clear({bool persist = true}) async {
    state = [];
    if (persist) await _repo.save(state);
  }
  
}

/// Public provider for the history list.
final historyProvider = StateNotifierProvider<HistoryNotifier, List<DetectionResult>>(
  (ref) => HistoryNotifier(const HistoryRepository()),
);

/// Helper to decide status from model output (adjust logic to your model's output).
HealthStatus statusFromModel({required String predictedLabel, double? confidence, double threshold = 0.5}) {
  // Example logic:
  // - if the label equals 'healthy' OR confidence is below threshold => healthy
  // - otherwise diseased
  final labelLower = predictedLabel.toLowerCase();
  if (labelLower.contains('healthy')) return HealthStatus.healthy;
  if (confidence != null) {
    return confidence >= threshold ? HealthStatus.diseased : HealthStatus.healthy;
  }
  // default fallback
  return HealthStatus.diseased;
}