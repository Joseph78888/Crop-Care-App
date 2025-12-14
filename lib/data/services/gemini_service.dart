import 'dart:async';
import 'dart:developer';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  // Access API key from environment variables
  static final String _apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

  late final GenerativeModel _model;
  late ChatSession _chat;

  GeminiService() {
    if (_apiKey.isEmpty) {
      log('Warning: GEMINI_API_KEY not found in environment variables');
    }
    _model = GenerativeModel(model: 'gemini-flash-latest', apiKey: _apiKey);
    _chat = _model.startChat();
  }

  /// Starts a new chat session, optionally with history.
  void startChat({List<Content>? history}) {
    _chat = _model.startChat(history: history);
  }

  /// Sends a message and returns a stream of the generated response chunks.
  Stream<String> streamMessage(String message) async* {
    if (_apiKey == 'YOUR_API_KEY_HERE') {
      yield "Error: API Key not set. Please set your Google Generative AI API key in `lib/data/services/gemini_service.dart`.";
      return;
    }

    try {
      final content = Content.text(message);
      final responseStream = _chat.sendMessageStream(content);

      await for (final chunk in responseStream) {
        if (chunk.text != null) {
          yield chunk.text!;
        }
      }
    } catch (e) {
      log(e.toString());
      yield "Error communicating with AI: $e";
    }
  }

  /// Sends a single message (non-streaming).
  Future<String?> sendMessage(String message) async {
    if (_apiKey == 'YOUR_API_KEY_HERE') {
      return "Error: API Key not set. Please set your Google Generative AI API key in `lib/data/services/gemini_service.dart`.";
    }

    try {
      final content = Content.text(message);
      final response = await _chat.sendMessage(content);
      return response.text;
    } catch (e) {
      return "Error communicating with AI: $e";
    }
  }
}
