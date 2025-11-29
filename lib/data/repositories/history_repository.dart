import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/detection_result.dart';

const _kHistoryPrefsKey = 'detection_history_v1';

class HistoryRepository {
  const HistoryRepository();

  Future<List<DetectionResult>> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_kHistoryPrefsKey);
      if (raw == null) return [];
      final List<dynamic> list = json.decode(raw) as List<dynamic>;
      return list.map((e) => DetectionResult.fromJson(e as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> save(List<DetectionResult> items) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = json.encode(items.map((e) => e.toJson()).toList());
      await prefs.setString(_kHistoryPrefsKey, raw);
    } catch (_) {}
  }
}
