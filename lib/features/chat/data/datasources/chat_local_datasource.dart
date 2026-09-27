// lib/features/chat/data/datasources/chat_local_datasource.dart
import 'package:domino/features/chat/domain/auto_reply_stage.dart';
import 'package:domino/utils/local_storage/storage_utility.dart';

class ChatLocalDatasource {
  final _storage = TLocalStorage();

  static const _messagesKey = 'support_chat_messages';
  static const _stageKey = 'support_chat_stage';

  List<Map<String, dynamic>> readMessages() {
    final raw = _storage.readData<List>(_messagesKey) ?? [];
    return raw.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  void save(List<Map<String, dynamic>> messages) =>
      _storage.saveData(_messagesKey, messages);

  TAutoReplyStage readStage() {
    final raw = _storage.readData<String>(_stageKey);
    return TAutoReplyStage.values.firstWhere(
      (s) => s.name == raw,
      orElse: () => TAutoReplyStage.idle,
    );
  }

  void saveStage(TAutoReplyStage stage) =>
      _storage.saveData(_stageKey, stage.name);

  void clear() {
    _storage.removeData(_messagesKey);
    _storage.removeData(_stageKey);
  }
}
