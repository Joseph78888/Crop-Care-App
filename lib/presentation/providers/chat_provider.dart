import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../data/models/chat_message_model.dart';
import '../../data/models/detection_result.dart';
import '../../data/models/disease_info_model.dart';
import '../../data/services/gemini_service.dart';

// Service provider
final geminiServiceProvider = Provider<GeminiService>((ref) {
  return GeminiService();
});

// State class for the Chat
class ChatState {
  final List<ChatMessageModel> messages;
  final bool isLoading;
  final String? error;
  final String? contextString;

  ChatState({
    required this.messages,
    this.isLoading = false,
    this.error,
    this.contextString,
  });

  ChatState copyWith({
    List<ChatMessageModel>? messages,
    bool? isLoading,
    String? error,
    String? contextString,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      contextString: contextString ?? this.contextString,
    );
  }
}

// Notifier
class ChatNotifier extends Notifier<ChatState> {
  late final GeminiService _geminiService;
  final _uuid = const Uuid();

  @override
  ChatState build() {
    // Initialize service
    _geminiService = ref.read(geminiServiceProvider);
    return ChatState(messages: []);
  }

  /// Sets the context for the chat session based on analysis results.
  void setContext(DetectionResult result, DiseaseInfo? info) {
    final buffer = StringBuffer();
    buffer.writeln("Current Analysis Context:");
    buffer.writeln("- Detected Issue: ${result.diseaseName}");
    buffer.writeln("- Confidence: ${(result.confidence ?? 0) * 100}%");

    if (info != null) {
      buffer.writeln("- Description: ${info.description}");
      if (info.recommendations.isNotEmpty) {
        buffer.writeln(
          "- Recommended Actions: ${info.recommendations.join(', ')}",
        );
      }
    }

    state = state.copyWith(contextString: buffer.toString());
    _startNewSession();
  }

  void _startNewSession() {
    List<Content>? history;
    if (state.contextString != null) {
      history = [
        Content.text(
          "You are an expert agronomist assistant. Use the following context to answer the user's questions if relevant: ${state.contextString}",
        ),
        Content.model([
          TextPart(
            "Understood. I will act as an expert agronomist using the provided context.",
          ),
        ]),
      ];
    }

    _geminiService.startChat(history: history);
  }

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

      String fullResponse = "";
      final botMessageId = _uuid.v4();

      var botMessage = ChatMessageModel(
        id: botMessageId,
        text: "",
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
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final chatProvider = NotifierProvider.autoDispose<ChatNotifier, ChatState>(
  ChatNotifier.new,
);
