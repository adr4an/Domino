import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flyer_chat_text_message/flyer_chat_text_message.dart';

class ChatTextBubble extends StatelessWidget {
  const ChatTextBubble({super.key, required this.message, required this.index});

  final TextMessage message;
  final int index;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme.bodyMedium;

    return FlyerChatTextMessage(
      message: message,
      index: index,
      sentBackgroundColor: TColors.black,
      receivedBackgroundColor: TColors.white,
      sentTextStyle: text?.copyWith(color: TColors.textWhite),
      receivedTextStyle: text?.copyWith(color: TColors.textPrimary),
    );
  }
}
