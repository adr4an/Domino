import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:domino/features/chat/data/datasources/chat_local_datasource.dart';
import 'package:domino/features/chat/data/datasources/support_faq.dart';
import 'package:domino/features/chat/data/models/stored_message.dart';
import 'package:domino/features/chat/domain/auto_reply_stage.dart';
import 'package:domino/utils/constants/texts/chat_text.dart';
import 'package:domino/utils/helpers/popups/dialogs.dart';
import 'package:domino/utils/helpers/popups/loaders.dart';
import 'package:domino/utils/helpers/timer/count_down_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:get/get.dart';

class SupportChatController extends GetxController {
  static const myId = 'me';
  static const staffId = 'staff';

  // Chat controller
  late final InMemoryChatController chat;
  final hasMessages = false.obs;
  final menuController = CustomPopupMenuController();

  // Composer
  final textController = TextEditingController();
  final hasText = false.obs;

  // End chat and rating
  final chatEnded = false.obs;
  final rating = 0.obs;
  final feedbackController = TextEditingController();

  // Local storage and timer
  final _local = ChatLocalDatasource();
  final _timer = TCountdownTimer(storageKey: 'support_chat_timer');
  static const _sessionSeconds = 30;

  TAutoReplyStage _stage = TAutoReplyStage.idle;

  void _persist() {
    _local.save(
      chat.messages.whereType<TextMessage>().map(StoredMessage.toMap).toList(),
    );
    _local.saveStage(_stage);
    _timer.start(_sessionSeconds);
  }

  // Clear the chat and end the session.
  void endChat() {
    // already ended, ignore repeat calls
    if (chatEnded.value) return;

    // set first, so the timer listener below can't re-trigger it
    chatEnded.value = true;

    _timer.cancel();
    _local.clear();
  }

  void setRating(int value) => rating.value = value;

  void submitRating() {
    debugPrint('rating: ${rating.value}, feedback: ${feedbackController.text}');
    // Firestore write goes here later

    Get.back(); // leave the chat screen
    TLoaders.successSnackBar(
      title: TChatText.thankYou,
      message: TChatText.feedbackThanksMessage,
    );
  }

  String? _nextReply(String? chipAnswer) {
    if (chipAnswer != null && _stage == TAutoReplyStage.idle) {
      _stage = TAutoReplyStage.awaitingDetails;
      return chipAnswer;
    }
    switch (_stage) {
      case TAutoReplyStage.idle:
        _stage = TAutoReplyStage.done;
        return TChatText.handoffDirect;
      case TAutoReplyStage.awaitingDetails:
        _stage = TAutoReplyStage.done;
        return TChatText.handoffAfterDetails;
      case TAutoReplyStage.done:
        return null;
    }
  }

  // EDIT: replace sendMessage
  void sendMessage(String text, {String? autoReply}) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    chat.insertMessage(
      TextMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        authorId: myId,
        createdAt: DateTime.now().toUtc(),
        text: trimmed,
      ),
    );

    final reply = _nextReply(autoReply); // updates _stage before saving
    _persist();

    hasMessages.value = true;
    textController.clear();
    hasText.value = false;

    if (reply != null) staffReply(reply);
  }

  Future<void> confirmEndChat() async {
    final confirmed = await WDialogs.confirm(
      title: TChatText.endChatTitle,
      message: TChatText.endChatMessage,
      confirmText: TChatText.endChatConfirm,
    );
    if (confirmed) endChat();
  }

  void onSuggestionSelected(String question) =>
      sendMessage(question, autoReply: SupportFaq.answerFor(question));

  // TEMPORARY: replaced by real staff replies once Firebase is connected.
  void staffReply(String text) {
    Future.delayed(const Duration(seconds: 1), () {
      chat.insertMessage(
        TextMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          authorId: staffId,
          createdAt: DateTime.now().toUtc(),
          text: text,
        ),
      );
      _persist();
    });
  }

  Future<User?> resolveUser(String id) async => User(
    id: id,
    name: id == staffId ? TChatText.supportName : TChatText.customerName,
  );

  void onTextChanged(String value) => hasText.value = value.trim().isNotEmpty;

  // Runs when the controller is initialized.
  @override
  void onInit() {
    super.onInit();

    _timer.resumeIfActive();

    var saved = _local.readMessages();

    // the session expired while the user was away
    if (saved.isNotEmpty && !_timer.isRunning.value) {
      _local.clear();
      saved = [];
    }

    _stage = saved.isEmpty ? TAutoReplyStage.idle : _local.readStage();

    chat = InMemoryChatController(
      messages: saved.map(StoredMessage.fromMap).toList(),
    );
    hasMessages.value = saved.isNotEmpty;

    ever(_timer.isRunning, (running) {
      if (!running && hasMessages.value && !chatEnded.value) endChat();
    });
  }

  @override
  void onClose() {
    textController.dispose();
    feedbackController.dispose();
    _timer.dispose();
    chat.dispose();
    menuController.dispose();
    super.onClose();
  }
}
