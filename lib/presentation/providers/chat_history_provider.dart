import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/chat_session_model.dart';
import '../../data/repositories/chat_history_repository.dart';

/// Notifier that manages the list of saved [ChatSessionModel]s.
class ChatHistoryNotifier extends Notifier<List<ChatSessionModel>> {
  late final ChatHistoryRepository _repo;

  @override
  List<ChatSessionModel> build() {
    _repo = const ChatHistoryRepository();
    _load();
    return [];
  }

  Future<void> _load() async {
    final sessions = await _repo.load();
    // Sorted newest first.
    sessions.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    state = sessions;
  }

  /// Upserts a session: updates if ID exists, otherwise inserts at front.
  Future<void> saveSession(ChatSessionModel session) async {
    final existing = state.indexWhere((s) => s.id == session.id);
    List<ChatSessionModel> updated;
    if (existing >= 0) {
      updated = [
        for (int i = 0; i < state.length; i++)
          if (i == existing) session else state[i],
      ];
    } else {
      updated = [session, ...state];
    }
    // Keep sorted newest first.
    updated.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    state = updated;
    await _repo.save(state);
  }

  /// Deletes a session by its [id].
  Future<void> deleteSession(String id) async {
    state = state.where((s) => s.id != id).toList();
    await _repo.save(state);
  }

  /// Clears all saved sessions.
  Future<void> clearAll() async {
    state = [];
    await _repo.save([]);
  }
}

final chatHistoryProvider =
    NotifierProvider<ChatHistoryNotifier, List<ChatSessionModel>>(
      ChatHistoryNotifier.new,
    );
