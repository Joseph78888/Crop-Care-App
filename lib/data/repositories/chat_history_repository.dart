import 'dart:convert';
import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

import '../models/chat_session_model.dart';

const _kChatHistoryKey = 'chat_history_v1';

/// Persists and loads [ChatSessionModel] list using [SharedPreferences].
class ChatHistoryRepository {
  const ChatHistoryRepository();

  Future<List<ChatSessionModel>> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_kChatHistoryKey);
      if (raw == null) return [];
      final list = json.decode(raw) as List<dynamic>;
      return list
          .map(
            (e) => ChatSessionModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } catch (e, s) {
      developer.log(
        'Failed to load chat history',
        name: 'cropcare.chat_history',
        level: 1000,
        error: e,
        stackTrace: s,
      );
      return [];
    }
  }

  Future<void> save(List<ChatSessionModel> sessions) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = json.encode(sessions.map((s) => s.toJson()).toList());
      await prefs.setString(_kChatHistoryKey, raw);
    } catch (e, s) {
      developer.log(
        'Failed to save chat history',
        name: 'cropcare.chat_history',
        level: 1000,
        error: e,
        stackTrace: s,
      );
    }
  }
}
