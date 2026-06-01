/// Roles a message can have in a chat session.
enum MessageRole { user, model }

/// A single chat message exchanged between user and AI.
class ChatMessageModel {
  final String id;
  final String text;
  final MessageRole role;
  final DateTime timestamp;

  const ChatMessageModel({
    required this.id,
    required this.text,
    required this.role,
    required this.timestamp,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] as String,
      text: json['text'] as String,
      role: (json['role'] as String) == 'user'
          ? MessageRole.user
          : MessageRole.model,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'role': role == MessageRole.user ? 'user' : 'model',
    'timestamp': timestamp.toIso8601String(),
  };
}
