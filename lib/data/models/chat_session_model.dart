import 'package:uuid/uuid.dart';

import 'chat_message_model.dart';

const _uuid = Uuid();

/// A saved chat session containing all messages between the user and the AI.
class ChatSessionModel {
  final String id;

  /// The session title — derived from the first user message.
  final String title;

  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ChatMessageModel> messages;

  ChatSessionModel({
    String? id,
    required this.title,
    DateTime? createdAt,
    DateTime? updatedAt,
    required this.messages,
  }) : id = id ?? _uuid.v4(),
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  ChatSessionModel copyWith({
    String? title,
    DateTime? updatedAt,
    List<ChatMessageModel>? messages,
  }) {
    return ChatSessionModel(
      id: id,
      title: title ?? this.title,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      messages: messages ?? this.messages,
    );
  }

  factory ChatSessionModel.fromJson(Map<String, dynamic> json) {
    return ChatSessionModel(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      messages: (json['messages'] as List<dynamic>)
          .map(
            (m) => ChatMessageModel.fromJson(m as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'messages': messages.map((m) => m.toJson()).toList(),
  };
}
