enum MessageRole { user, model }

class ChatMessageModel {
  final String id;
  final String text;
  final MessageRole role;
  final DateTime timestamp;

  ChatMessageModel({
    required this.id,
    required this.text,
    required this.role,
    required this.timestamp,
  });
}
