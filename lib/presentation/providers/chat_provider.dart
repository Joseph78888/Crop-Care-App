import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../data/models/chat_message_model.dart';
import '../../data/models/chat_session_model.dart';
import '../../data/models/detection_result.dart';
import '../../data/models/disease_info_model.dart';
import '../../data/services/gemini_service.dart';
import 'chat_history_provider.dart';

/// Provider that exposes the [GeminiService] singleton.
final geminiServiceProvider = Provider<GeminiService>((ref) {
  return GeminiService();
});

/// Immutable state for the active chat session.
class ChatState {
  final String sessionId;
  final List<ChatMessageModel> messages;
  final bool isLoading;
  final String? error;
  final String? contextString;

  ChatState({
    String? sessionId,
    required this.messages,
    this.isLoading = false,
    this.error,
    this.contextString,
  }) : sessionId = sessionId ?? const Uuid().v4();

  ChatState copyWith({
    String? sessionId,
    List<ChatMessageModel>? messages,
    bool? isLoading,
    String? error,
    String? contextString,
  }) {
    return ChatState(
      sessionId: sessionId ?? this.sessionId,
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      contextString: contextString ?? this.contextString,
    );
  }
}

/// Notifier for the active chat session.
class ChatNotifier extends Notifier<ChatState> {
  late final GeminiService _geminiService;
  final _uuid = const Uuid();

  @override
  ChatState build() {
    _geminiService = ref.read(geminiServiceProvider);
    return ChatState(messages: []);
  }

  // ── Public API ──────────────────────────────────────────────────────────────

  /// Sets an agronomist context from a detection result and starts a fresh
  /// Gemini session seeded with that context.
  void setContext(DetectionResult result, DiseaseInfo? info) {
    final buffer = StringBuffer();
    buffer.writeln('Current Analysis Context:');
    buffer.writeln('- Detected Issue: ${result.diseaseName}');
    buffer.writeln('- Confidence: ${(result.confidence ?? 0) * 100}%');
    if (info != null) {
      buffer.writeln('- Description: ${info.description}');
      if (info.recommendations.isNotEmpty) {
        buffer.writeln(
          '- Recommended Actions: ${info.recommendations.join(', ')}',
        );
      }
    }
    state = state.copyWith(contextString: buffer.toString());
    _startGeminiSession();
  }

  /// Loads a saved [ChatSessionModel] into the active state, resuming
  /// the Gemini session with the saved message history.
  void loadSession(ChatSessionModel session) {
    state = ChatState(
      sessionId: session.id,
      messages: List.from(session.messages),
      contextString: null,
    );
    _startGeminiSession(existingMessages: session.messages);
  }

  /// Resets to a blank session (new chat).
  void startNewSession() {
    state = ChatState(messages: []);
    _geminiService.startChat();
  }

  /// Sends a user message and streams the AI response.
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userMessage = ChatMessageModel(
      id: _uuid.v4(),
      text: text,
      role: MessageRole.user,
      timestamp: DateTime.now(),
    );

    state = state.copyWith(
      messages: [...state.messages, userMessage],
      isLoading: true,
      error: null,
    );

    try {
      final stream = _geminiService.streamMessage(text);
      String fullResponse = '';
      final botMessageId = _uuid.v4();

      var botMessage = ChatMessageModel(
        id: botMessageId,
        text: '',
        role: MessageRole.model,
        timestamp: DateTime.now(),
      );

      state = state.copyWith(messages: [...state.messages, botMessage]);

      await for (final chunk in stream) {
        fullResponse += chunk;
        final updatedMessages = List<ChatMessageModel>.from(state.messages);
        updatedMessages.last = ChatMessageModel(
          id: botMessageId,
          text: fullResponse,
          role: MessageRole.model,
          timestamp: DateTime.now(),
        );
        state = state.copyWith(messages: updatedMessages);
      }

      // Persist the session after a complete exchange.
      await _persistSession();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // ── Private helpers ─────────────────────────────────────────────────────────

  void _startGeminiSession({List<ChatMessageModel>? existingMessages}) {
    List<Content>? history;

    if (state.contextString != null) {
      history = [
        Content.text(
          'You are an expert agronomist assistant. Use the following context '
          'to answer the user\'s questions if relevant: ${state.contextString}',
        ),
        Content.model([
          TextPart(
            'Understood. I will act as an expert agronomist using the '
            'provided context.',
          ),
        ]),
      ];
    } else if (existingMessages != null && existingMessages.isNotEmpty) {
      // Rebuild Gemini history from saved messages so the model has context.
      history = existingMessages.map((m) {
        if (m.role == MessageRole.user) {
          return Content.text(m.text);
        } else {
          return Content.model([TextPart(m.text)]);
        }
      }).toList();
    }

    _geminiService.startChat(history: history);
  }

  Future<void> _persistSession() async {
    final messages = state.messages;
    if (messages.isEmpty) return;

    final firstUserMsg = messages.firstWhere(
      (m) => m.role == MessageRole.user,
      orElse: () => messages.first,
    );

    final title = firstUserMsg.text.length > 60
        ? '${firstUserMsg.text.substring(0, 57)}...'
        : firstUserMsg.text;

    final session = ChatSessionModel(
      id: state.sessionId,
      title: title,
      updatedAt: DateTime.now(),
      messages: messages,
    );

    await ref.read(chatHistoryProvider.notifier).saveSession(session);
  }
}

final chatProvider = NotifierProvider.autoDispose<ChatNotifier, ChatState>(
  ChatNotifier.new,
);
