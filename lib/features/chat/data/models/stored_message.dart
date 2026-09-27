import 'package:flutter_chat_core/flutter_chat_core.dart';

// Represents a message stored in local storage.
class StoredMessage {
  StoredMessage._();

  static Map<String, dynamic> toMap(TextMessage m) => {
    'id': m.id,
    'authorId': m.authorId,
    'text': m.text,
    'createdAt': (m.createdAt ?? DateTime.now().toUtc()).toIso8601String(),
  };

  static TextMessage fromMap(Map<String, dynamic> map) => TextMessage(
    id: map['id'],
    authorId: map['authorId'],
    text: map['text'],
    createdAt: DateTime.parse(map['createdAt']),
  );
}
